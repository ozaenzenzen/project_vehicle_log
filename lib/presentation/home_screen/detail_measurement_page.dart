import 'package:flutter/material.dart';
import 'package:project_vehicle_log/data/vehicle_data_model.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class DetailMeasurementPage extends StatefulWidget {
  // final String title;
  final VehicleDataModel data;
  final int index;

  const DetailMeasurementPage({
    Key? key,
    // required this.title,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailMeasurementPage> createState() => _DetailMeasurementPageState();
}

class _DetailMeasurementPageState extends State<DetailMeasurementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.shape,
      appBar: AppBar(
        title: Text(
          // "Detail Measurement: ${widget.title}",
          "${widget.data.vehicleName}: ${widget.data.listControl![widget.index]}",
          textAlign: TextAlign.left,
          style: AppTheme.theme.textTheme.headline3?.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
