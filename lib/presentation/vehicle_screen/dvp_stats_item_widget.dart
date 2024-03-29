import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/edit_measurement_page.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class DVPStatsItemWidget extends StatefulWidget {
  final String? title;
  final CategorizedVehicleLogData? data;

  const DVPStatsItemWidget({
    Key? key,
    required this.title,
    this.data,
  }) : super(key: key);

  @override
  State<DVPStatsItemWidget> createState() => _DVPStatsItemWidgetState();
}

class _DVPStatsItemWidgetState extends State<DVPStatsItemWidget> {
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title.toString(),
                style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const EditMeasurementPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        // color: AppColor.green,
                        color: AppColor.primary,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "Update",
                    style: AppTheme.theme.textTheme.titleLarge?.copyWith(
                      color: AppColor.primary,
                      // color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Expenses'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<VehicleMeasurementLogModel, String>>[
              LineSeries<VehicleMeasurementLogModel, String>(
                dataSource: widget.data!.vehicleMeasurementLogModels!,
                xValueMapper: (VehicleMeasurementLogModel sales, _) {
                  return sales.createdAt.toString();
                },
                yValueMapper: (VehicleMeasurementLogModel sales, _) {
                  return int.parse((sales.amountExpenses == "") ? "0" : sales.amountExpenses!);
                },
                // Enable data label
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
              )
            ],
            // series: <LineSeries<SalesData, String>>[
            //   LineSeries<SalesData, String>(
            //     dataSource: <SalesData>[
            //       SalesData('Jan', 20000),
            //       SalesData('Feb', 28000),
            //       SalesData('Mar', 32000),
            //       SalesData('Apr', 35000),
            //       SalesData('May', 30000),
            //     ],
            //     xValueMapper: (SalesData sales, _) => sales.year,
            //     yValueMapper: (SalesData sales, _) => sales.sales,
            //     // Enable data label
            //     dataLabelSettings: DataLabelSettings(
            //       isVisible: true,
            //     ),
            //   )
            // ],
          ),
          SizedBox(height: 5.h),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Odo Changes'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<VehicleMeasurementLogModel, String>>[
              LineSeries<VehicleMeasurementLogModel, String>(
                dataSource: widget.data!.vehicleMeasurementLogModels!,
                xValueMapper: (VehicleMeasurementLogModel sales, _) => sales.createdAt.toString(),
                yValueMapper: (VehicleMeasurementLogModel sales, _) => int.parse((sales.currentOdo == "") ? "0" : sales.currentOdo!),
                // Enable data label
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
              )
            ],
            // series: <LineSeries<SalesData, String>>[
            //   LineSeries<SalesData, String>(
            //     dataSource: <SalesData>[
            //       SalesData('Jan', 20000),
            //       SalesData('Feb', 24200),
            //       SalesData('Mar', 28000),
            //       SalesData('Apr', 32900),
            //       SalesData('May', 36000),
            //     ],
            //     xValueMapper: (SalesData sales, _) => sales.year,
            //     yValueMapper: (SalesData sales, _) => sales.sales,
            //     // Enable data label
            //     dataLabelSettings: DataLabelSettings(
            //       isVisible: true,
            //     ),
            //   )
            // ],
          ),
        ],
      ),
    );
  }
}
