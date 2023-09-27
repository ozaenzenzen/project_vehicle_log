import 'package:flutter/material.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/presentation/widget/appbar_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class DetailMeasurementPage extends StatefulWidget {
  // final String title;
  // final VehicleDataModel data;
  final DatumVehicle data;
  // final dynamic data;
  // final CategorizedVehicleLogData data;
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
      appBar: AppBarWidget(
        title: "${widget.data.vehicleName}: ${widget.data.categorizedData![widget.index].measurementTitle}",
      ),
    );
  }
}
