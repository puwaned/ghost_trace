import 'package:isar/isar.dart';

part 'fog_tile_model.g.dart';

@collection
class FogTileModel {
  Id id = Isar.autoIncrement;

  /// Latitude bucketed to ~5m resolution
  late double latitude;

  /// Longitude bucketed to ~5m resolution
  late double longitude;

  late DateTime exploredAt;

  FogTileModel();
}
