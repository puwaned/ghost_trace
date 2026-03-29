class AppConstants {
  AppConstants._();

  // --- Echo discovery ---
  static const double echoDiscoveryRadiusMeters = 10.0;
  static const int echoInitialLifeForce = 100;
  static const int echoDecayRatePerDay = 5;
  static const int echoMaxContentLength = 280;
  static const int echoPurgeAfterDays = 7;

  // --- Fog of War ---
  static const double fogTileResolutionMeters = 5.0;
  /// Degrees per fog tile bucket (~5m at equator ≈ 0.000045°)
  static const double fogTileBucketDegrees = 0.000045;

  // --- Location ---
  static const int locationDistanceFilterMeters = 5;
  static const int locationUpdateIntervalMs = 3000;

  // --- Storage keys ---
  static const String prefDeviceId = 'device_id';
}
