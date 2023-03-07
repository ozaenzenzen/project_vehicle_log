import 'package:flutter/material.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Vehicle",
          textAlign: TextAlign.left,
          style: AppTheme.theme.textTheme.headline4?.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
