# GhostTrace — Implementation Plan

## Problem Statement
Transform a blank `flutter create` scaffold into a geo-mystery app where users drop and discover location-locked "Echoes" on a Fog-of-War map.

## Confirmed Decisions
| Concern | Choice |
|---|---|
| State Management | **Bloc** |
| Local DB | **Isar** |
| Maps | **flutter_map** |
| Backend | **Supabase + PostGIS** |
| Location | **geolocator** |
| Auth | **Anonymous only** (no login) |
| Echo types (MVP) | **Text notes only** |
| Theme | **Dark mode by default** |

---

## MVP Definition of Done
1. Walking 10m away from a dropped Echo locks it on the map
2. Fog of War persists cleared areas between app sessions
3. Background notification fires when user walks past a hidden Echo

---

## Phases

### Phase 1 — Project Setup & Foundation
- [ ] Add all dependencies to `pubspec.yaml`
- [ ] Scaffold folder structure (`core/`, `data/`, `features/`)
- [ ] Set up dark theme (`AppTheme`)
- [ ] Define app constants (radius, decay rate, etc.)
- [ ] Create Isar schemas: `EchoModel`, `FogTileModel`
- [ ] Initialize Isar + Supabase in `main.dart`
- [ ] Generate & persist anonymous device ID (UUID → SharedPreferences)

### Phase 2 — Location Service
- [ ] Implement `LocationBloc` with `geolocator` position stream
- [ ] Handle foreground + background location permissions
- [ ] Configure platform manifests (Android + iOS)
- [ ] Implement 10m geofence proximity check (emit events on enter/exit)

### Phase 3 — Map & Fog of War
- [ ] Integrate `flutter_map` with dark tile layer (CartoDB Dark Matter)
- [ ] Build `FogOfWarPainter` (CustomPainter) punching holes at explored tiles
- [ ] Persist FogTiles to Isar on each location update
- [ ] Load persisted FogTiles on app start (offline-first)
- [ ] Animate fog reveal (expanding circle animation)

### Phase 4 — Echo System
- [ ] Define Supabase schema + PostGIS index + `get_nearby_echoes` RPC
- [ ] Drop Echo flow: long-press map → text input → POST to Supabase
- [ ] Discover Echo: PostGIS `ST_DWithin` query on proximity event
- [ ] Map markers: ghost icon (hidden) vs glowing icon (discovered)
- [ ] Echo detail view: content, life force bar, like button

### Phase 5 — Temporal Decay & Time Capsules
- [ ] Supabase daily decay job (pg_cron / Edge Function)
- [ ] Like action resets/boosts `life_force` in Supabase
- [ ] Time Capsule type: `unlock_at` date gating discovery
- [ ] Locked time capsule UI: sealed icon + countdown timer

### Phase 6 — Notifications
- [ ] Set up `flutter_local_notifications`
- [ ] Trigger notification on proximity event (background)
- [ ] Android foreground service + iOS background location mode config
