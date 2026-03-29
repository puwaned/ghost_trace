import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'data/models/echo_model.dart';
import 'data/models/fog_tile_model.dart';

late Isar isar;
late String deviceId;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initSupabase();
  await _initIsar();
  await _initDeviceId();

  runApp(const GhostTraceApp());
}

Future<void> _initSupabase() async {
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );
}

Future<void> _initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [EchoModelSchema, FogTileModelSchema],
    directory: dir.path,
  );
}

Future<void> _initDeviceId() async {
  final prefs = await SharedPreferences.getInstance();
  final stored = prefs.getString(AppConstants.prefDeviceId);
  if (stored != null) {
    deviceId = stored;
  } else {
    deviceId = const Uuid().v4();
    await prefs.setString(AppConstants.prefDeviceId, deviceId);
  }
}

class GhostTraceApp extends StatelessWidget {
  const GhostTraceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GhostTrace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const Scaffold(
        body: Center(
          child: Text('GhostTrace'),
        ),
      ),
    );
  }
}
