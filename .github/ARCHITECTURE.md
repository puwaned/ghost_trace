# GhostTrace — Architecture

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (mobile only — Android & iOS) |
| Language | Dart |
| State Management | `flutter_bloc` + `bloc` + `equatable` |
| Local Database | `isar` + `isar_flutter_libs` |
| Maps | `flutter_map` + `latlong2` |
| Location | `geolocator` + `permission_handler` |
| Backend | Supabase (PostgreSQL + PostGIS) |
| Notifications | `flutter_local_notifications` |
| Utilities | `uuid`, `shared_preferences` |
| Theme | Dark mode by default |

---

## Folder Structure

```
lib/
├── core/
│   ├── theme/           # AppTheme — dark ThemeData, colors, text styles
│   ├── constants/       # AppConstants — radius (10m), decay rate, etc.
│   ├── extensions/      # LatLng helpers, DateTime extensions
│   └── utils/           # Haversine distance calc, UUID generator
│
├── data/
│   ├── models/
│   │   ├── echo_model.dart       # Isar schema + Supabase DTO
│   │   └── fog_tile_model.dart   # Isar schema for explored tiles
│   ├── repositories/
│   │   ├── echo_repository.dart
│   │   └── fog_repository.dart
│   └── datasources/
│       ├── local/                # Isar data sources
│       └── remote/               # Supabase client + RPC calls
│
└── features/
    ├── map/
    │   ├── screens/map_screen.dart
    │   ├── widgets/fog_of_war_overlay.dart   # CustomPainter
    │   └── bloc/map_bloc.dart
    ├── echo/
    │   ├── screens/echo_detail_screen.dart
    │   ├── widgets/echo_marker.dart
    │   └── bloc/echo_bloc.dart
    ├── location/
    │   └── bloc/location_bloc.dart
    └── notifications/
        └── notification_service.dart
```

---

## Data Models

### Echo (Isar + Supabase)

| Field | Type | Notes |
|---|---|---|
| `id` | `String` (UUID) | Primary key |
| `authorDeviceId` | `String` | Anonymous device UUID |
| `latitude` | `double` | Drop location |
| `longitude` | `double` | Drop location |
| `content` | `String` | Text note (max 280 chars) |
| `type` | `EchoType` | `normal` \| `timeCapsule` |
| `unlockAt` | `DateTime?` | Time capsule unlock date |
| `lifeForce` | `int` | 0–100, decays over time |
| `createdAt` | `DateTime` | Creation timestamp |
| `expiresAt` | `DateTime?` | Auto-purge date |
| `isDiscovered` | `bool` | Local only — has user found it? |

### FogTile (Isar — local only)

| Field | Type | Notes |
|---|---|---|
| `id` | `int` | Isar auto-id |
| `latitude` | `double` | Bucketed to ~5m resolution |
| `longitude` | `double` | Bucketed to ~5m resolution |
| `exploredAt` | `DateTime` | When tile was first revealed |

---

## Supabase Schema

```sql
-- Echoes table
CREATE TABLE echoes (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  author_device_id TEXT NOT NULL,
  location      GEOGRAPHY(Point, 4326) NOT NULL,
  content       TEXT NOT NULL,
  type          TEXT NOT NULL DEFAULT 'normal',
  unlock_at     TIMESTAMPTZ,
  life_force    INT NOT NULL DEFAULT 100,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  expires_at    TIMESTAMPTZ,
  is_deleted    BOOLEAN NOT NULL DEFAULT FALSE
);

-- Spatial index for radius queries
CREATE INDEX echoes_location_idx ON echoes USING GIST (location);

-- RPC: fetch echoes within radius (meters)
CREATE OR REPLACE FUNCTION get_nearby_echoes(
  lat FLOAT, lng FLOAT, radius_meters FLOAT
)
RETURNS SETOF echoes AS $$
  SELECT * FROM echoes
  WHERE NOT is_deleted
    AND life_force > 0
    AND (type != 'timeCapsule' OR unlock_at IS NULL OR unlock_at <= NOW())
    AND ST_DWithin(
      location,
      ST_SetSRID(ST_MakePoint(lng, lat), 4326)::GEOGRAPHY,
      radius_meters
    );
$$ LANGUAGE SQL;
```

---

## Key Design Decisions

### Fog of War
- FogTiles are stored as discrete lat/lng buckets (rounded to ~5m precision)
- On every location update: check if bucket exists → if not, insert + repaint
- CustomPainter renders full-canvas dark overlay, then `canvas.drawCircle` with `BlendMode.clear` for each explored tile
- Tiles are **permanent** — once explored, never re-fogged

### Echo Discovery
- `LocationBloc` streams `geolocator` positions with `distanceFilter: 5` (meters)
- On each update: Haversine check against locally-cached Echo coordinates
- On proximity enter (<10m): fetch full Echo from Supabase, mark `isDiscovered = true` in Isar
- On proximity exit (>10m): Echo re-locks on map (marker reverts to ghost icon)

### Temporal Decay
- `life_force` starts at 100, decremented by 5 per day via Supabase pg_cron
- A "like" from any visitor resets the decay clock (sets `life_force = 100`)
- Echoes with `life_force <= 0` are soft-deleted (`is_deleted = true`) then purged after 7 days

### Anonymous Identity
- On first launch, generate a `UUID v4` and store in `SharedPreferences`
- This `deviceId` is attached to all Echoes the user drops
- No accounts, no login — fully anonymous

### State Management (Bloc)
- `LocationBloc`: Manages GPS stream, emits position + proximity events
- `EchoBloc`: Manages nearby Echoes list, drop/discover actions
- `MapBloc`: Manages fog state, explored tiles list
- All Blocs listen to `LocationBloc` stream for position updates
