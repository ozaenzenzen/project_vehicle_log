import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_vehicle_log/data/dummy_data_service.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_secondarybutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class EditMeasurementPage extends StatefulWidget {
  const EditMeasurementPage({Key? key}) : super(key: key);

  @override
  State<EditMeasurementPage> createState() => _EditMeasurementPageState();
}

class _EditMeasurementPageState extends State<EditMeasurementPage> {
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
            "Edit Measurement",
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
                // SizedBox(height: 20.h),
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
                  text: "Update",
                ),
                SizedBox(height: 10.h),
                AppSecondaryButtonWidget.error(
                  onPressed: () {
                    Get.back();
                  },
                  text: "Delete",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
