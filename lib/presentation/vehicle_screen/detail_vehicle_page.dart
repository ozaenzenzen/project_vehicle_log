import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/add_measurement_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class DetailVehiclePage extends StatefulWidget {
  const DetailVehiclePage({Key? key}) : super(key: key);

  @override
  State<DetailVehiclePage> createState() => _DetailVehiclePageState();
}

class _DetailVehiclePageState extends State<DetailVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.shape,
      appBar: AppBar(
        title: Text(
          "Detail Vehicle Page",
          textAlign: TextAlign.left,
          style: AppTheme.theme.textTheme.headline3?.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name Vehicle",
                style: AppTheme.theme.textTheme.headline1?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Main Info",
                    style: AppTheme.theme.textTheme.headline4?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.edit_square,
                    size: 25.h,
                    color: AppColor.primary,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const ItemListWidget(
                title: "Year",
                value: "2015",
              ),
              SizedBox(height: 10.h),
              const ItemListWidget(
                title: "Engine Capacity (cc)",
                value: "250",
              ),
              SizedBox(height: 10.h),
              const ItemListWidget(
                title: "Color",
                value: "Red",
              ),
              SizedBox(height: 10.h),
              const ItemListWidget(
                title: "Machine Number",
                value: "xxxxxxx",
              ),
              SizedBox(height: 10.h),
              const ItemListWidget(
                title: "Chassis Number",
                value: "xxxxxxx",
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logs",
                    style: AppTheme.theme.textTheme.headline4?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.edit_square,
                    size: 25.h,
                    color: AppColor.primary,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return const ItemListWidget(
                    title: "Oil",
                    value: "12000",
                  );
                },
              ),
              SizedBox(height: 5.h),
              Center(
                child: Text(
                  "See more",
                  style: AppTheme.theme.textTheme.headline6?.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColor.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stats",
                    style: AppTheme.theme.textTheme.headline4?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.edit_square,
                    size: 25.h,
                    color: AppColor.primary,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 250.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You haven't yet set measurement stats",
                      style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
                        // color: AppColor.text_4,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    AppMainButtonWidget(
                      onPressed: () {
                        Get.to(() => const AddMeasurementPage());
                      },
                      text: "Add Now",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final String? title;
  final String? value;

  const ItemListWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: AppColor.border,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              // color: AppColor.text_4,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value!,
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              // color: AppColor.text_4,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
