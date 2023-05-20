import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/home_screen/home_page.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_info.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daftar Akun",
                style: AppTheme.theme.textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            const AppTextFieldWidget(
              textFieldTitle: "Nama",
              textFieldHintText: "example",
            ),
            SizedBox(height: 10.h),
            const AppTextFieldWidget(
              textFieldTitle: "Email",
              textFieldHintText: "journalist@email.com",
            ),
            SizedBox(height: 10.h),
            const AppTextFieldWidget(
              textFieldTitle: "Phone",
              textFieldHintText: "0888-8888-8888",
            ),
            SizedBox(height: 10.h),
            const AppTextFieldWidget(
              textFieldTitle: "Password",
              textFieldHintText: "*****",
            ),
            SizedBox(height: 10.h),
            const AppTextFieldWidget(
              textFieldTitle: "Confirm Password",
              textFieldHintText: "*****",
            ),
            SizedBox(height: 20.h),
            AppMainButtonWidget(
              onPressed: () {
                // Get.offAll(
                //   () => const MainPage(),
                // );
              },
              text: "Daftar",
            ),
            SizedBox(height: 20.h),
            Text("Sudah Ada Akun?"),
            SizedBox(height: 20.h),
            AppMainButtonWidget(
              onPressed: () {
                Get.to(
                  () => const MainPage(),
                );
              },
              text: "Masuk",
            ),
            SizedBox(height: 20.h),
            const Spacer(),
            FutureBuilder(
                future: AppInfo.showAppVersion(),
                builder: (context, snapshot) {
                  return Text(
                    // "Vehicle Log Apps Version 1.0.0+1",
                    // "Vehicle Log Apps Version ${AppInfo.appVersion}",
                    "Vehicle Log Apps Version ${snapshot.data}",
                    style: AppTheme.theme.textTheme.caption?.copyWith(
                      fontSize: 10.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
