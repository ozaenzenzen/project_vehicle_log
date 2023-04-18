import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class EditMainInfoPage extends StatefulWidget {
  const EditMainInfoPage({Key? key}) : super(key: key);

  @override
  State<EditMainInfoPage> createState() => _EditMainInfoPageState();
}

class _EditMainInfoPageState extends State<EditMainInfoPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Vehicle",
            textAlign: TextAlign.left,
            style: AppTheme.theme.textTheme.headline3?.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.shape,
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Vehicle",
                  style: AppTheme.theme.textTheme.headline1?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Edit your vehicle alongside with measurement parameter",
                  style: AppTheme.theme.textTheme.headline5?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Vehicle Image",
                  style: AppTheme.theme.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff331814),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                DottedBorder(
                  radius: const Radius.circular(20),
                  dashPattern: const [7, 3],
                  strokeWidth: 2,
                  color: AppColor.blue,
                  child: Container(
                    height: 200.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.border,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          size: 24.h,
                          color: AppColor.blue,
                        ),
                        SizedBox(width: 18.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Browse File",
                              style: AppTheme.theme.textTheme.headline4?.copyWith(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                color: AppColor.blue,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Format dokumen .jpg",
                              style: AppTheme.theme.textTheme.headline5?.copyWith(
                                color: AppColor.disabled,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Vehicle Name",
                  textFieldHintText: "Vehicle Name",
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Year",
                  textFieldHintText: "Year",
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Engine Capacity (cc)",
                  textFieldHintText: "ex: 250",
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Tank Capacity (Litre)",
                  textFieldHintText: "ex: 250",
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Color",
                  textFieldHintText: "Color",
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Machine Number",
                  textFieldHintText: "Machine Number",
                ),
                SizedBox(height: 15.h),
                const AppTextFieldWidget(
                  textFieldTitle: "Chassis Number",
                  textFieldHintText: "Chassis Number",
                ),
                SizedBox(height: 20.h),
                AppMainButtonWidget(
                  onPressed: () {
                    // Get.off(() => const MainPage());
                  },
                  text: "Edit Vehicle",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
