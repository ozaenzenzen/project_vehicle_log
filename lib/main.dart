import 'package:flutter/material.dart';
import 'package:project_vehicle_log/app.dart';
import 'package:project_vehicle_log/init_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitConfig.init();
  runApp(const MyApp());
}