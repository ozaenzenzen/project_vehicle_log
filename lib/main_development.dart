import 'package:flutter/material.dart';
import 'package:project_vehicle_log/app.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/init_config.dart';

void main() async {
  EnvironmentConfig.flavor = Flavor.development;
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitConfig.init();
  runApp(const MyApp());
}