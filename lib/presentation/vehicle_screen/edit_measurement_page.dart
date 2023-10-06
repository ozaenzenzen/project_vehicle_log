import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_secondarybutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/presentation/widget/appbar_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class EditMeasurementPage extends StatefulWidget {
  final VehicleMeasurementLogModel data;

  const EditMeasurementPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<EditMeasurementPage> createState() => _EditMeasurementPageState();
}

class _EditMeasurementPageState extends State<EditMeasurementPage> {
  DateFormat formattedDate = DateFormat('yyyy-MM-dd');

  TextEditingController checkpointDateController = TextEditingController();

  TextEditingController measurementTitleController = TextEditingController();
  TextEditingController currentOdoController = TextEditingController();
  TextEditingController estimateOdoChangingController = TextEditingController();
  TextEditingController amountExpensesController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    measurementTitleController.text = widget.data.measurementTitle ?? "";
    currentOdoController.text = widget.data.currentOdo ?? "";
    estimateOdoChangingController.text = widget.data.estimateOdoChanging ?? "";
    amountExpensesController.text = widget.data.amountExpenses ?? "";
    checkpointDateController.text = formattedDate.parse(widget.data.checkpointDate ?? DateTime.now().toString()).toString();
    notesController.text = widget.data.notes ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const AppBarWidget(
          title: "Edit Measurement",
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
                      style: AppTheme.theme.textTheme.headlineMedium?.copyWith(
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
                AppTextFieldWidget(
                  textFieldTitle: "Measurement Title",
                  textFieldHintText: "ex: Oil",
                  controller: measurementTitleController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Current Odo (km)",
                  textFieldHintText: "ex: 12000",
                  controller: currentOdoController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Estimate Odo Changing (km)",
                  textFieldHintText: "ex: 14000",
                  controller: estimateOdoChangingController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Amount Expenses (Rp)",
                  textFieldHintText: "ex: 40000",
                  controller: amountExpensesController,
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
                      debugPrint("Date is not selected");
                    }
                  },
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Notes",
                  textFieldHintText: "notes",
                  controller: notesController,
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
