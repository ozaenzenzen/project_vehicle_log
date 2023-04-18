import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_vehicle_log/data/dummy_data_service.dart';
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
  TextEditingController checkpointDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                  height: 100.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // itemCount: 8,
                    itemCount: MeasurementServiceDummyData.dummyDataService.length,
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
                          width: 100.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.h,
                          ),
                          decoration: BoxDecoration(
                            // color: index == indexClicked ? AppColor.primary : Colors.transparent,
                            color: AppColor.border,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                // Icons.time_to_leave_rounded,
                                MeasurementServiceDummyData.dummyDataService[index].icons,
                              ),
                              Text(
                                // "${DummyData.dummyData[index].vehicleName}",
                                // "Menu $index",
                                "${MeasurementServiceDummyData.dummyDataService[index].title}",
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.ellipsis,
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
                  textFieldTitle: "Amount Expenses (Rp)",
                  textFieldHintText: "ex: 40000",
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Checkpoint Date",
                  textFieldHintText: "12-2-2023",
                  controller: checkpointDateController,
                  readOnly: true,
                  suffixIcon: const Icon(Icons.date_range_sharp),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      debugPrint(pickedDate.toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      debugPrint(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        checkpointDateController.text = formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
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
      ),
    );
  }
}
