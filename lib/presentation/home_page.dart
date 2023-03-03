import 'package:flutter/material.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vehicle Logs",
          style: AppTheme.theme.textTheme.headline3?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("center"),
      ),
    );
  }
}
