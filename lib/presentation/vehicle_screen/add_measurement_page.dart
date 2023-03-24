import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class AddMeasurementPage extends StatefulWidget {
  const AddMeasurementPage({Key? key}) : super(key: key);

  @override
  State<AddMeasurementPage> createState() => _AddMeasurementPageState();
}

class _AddMeasurementPageState extends State<AddMeasurementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Measurement",
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Service",
                    style: AppTheme.theme.textTheme.headline4?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Icon(
                  //   Icons.edit_square,
                  //   size: 25.h,
                  //   color: AppColor.primary,
                  // ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 80.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  // itemCount: DummyData.dummyData.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10.h);
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // setState(() {
                        //   debugPrint("test hit $index");
                        //   indexClicked = index;
                        //   vehicleListColor = AppColor.white;
                        // });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                        ),
                        decoration: BoxDecoration(
                          // color: index == indexClicked ? AppColor.primary : Colors.transparent,
                          color: AppColor.disabled,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.time_to_leave_rounded,
                            ),
                            Text(
                              // "${DummyData.dummyData[index].vehicleName}",
                              "Menu $index",
                              style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                                // color: AppColor.text_4,
                                color: Colors.black38,
                                // color: index == indexClicked ? AppColor.white : Colors.black38,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              // Wrap(
              //   spacing: 10.h,
              //   runSpacing: 10.h,
              //   children: [
              //     Container(
              //       height: 40.h,
              //       width: 100.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: AppColor.disabled,
              //       ),
              //       alignment: Alignment.center,
              //       child: Text("Oil"),
              //     ),
              //     Container(
              //       height: 40.h,
              //       width: 100.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: AppColor.disabled,
              //       ),
              //       alignment: Alignment.center,
              //       child: Text("Oil"),
              //     ),
              //     Container(
              //       height: 40.h,
              //       width: 100.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: AppColor.disabled,
              //       ),
              //       alignment: Alignment.center,
              //       child: Text("Oil"),
              //     ),
              //     Container(
              //       height: 40.h,
              //       width: 100.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: AppColor.disabled,
              //       ),
              //       alignment: Alignment.center,
              //       child: Text("Oil"),
              //     ),
              //     Container(
              //       height: 40.h,
              //       width: 100.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: AppColor.disabled,
              //       ),
              //       alignment: Alignment.center,
              //       child: Text("Oil"),
              //     ),
              //   ],
              // ),
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
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Measurement Title",
                textFieldHintText: "ex: Oil",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Current Odo (km)",
                textFieldHintText: "ex: 12000",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Estimate Odo Changing (km)",
                textFieldHintText: "ex: 14000",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Amount (Rp)",
                textFieldHintText: "ex: 40000",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Checkpoint Date",
                textFieldHintText: "12-2-2023",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Notes",
                textFieldHintText: "notes",
              ),
              SizedBox(height: 25.h),
              AppMainButtonWidget(
                onPressed: () {
                  Get.back();
                },
                text: "Add",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
