import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          style: AppTheme.theme.textTheme.headline3?.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColor.shape,
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Vehicle",
              style: AppTheme.theme.textTheme.headline1?.copyWith(
                // color: AppColor.text_4,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Add your vehicle alongside with measurement parameter",
              style: AppTheme.theme.textTheme.headline5?.copyWith(
                // color: AppColor.text_4,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
