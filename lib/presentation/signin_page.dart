import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/home_screen/home_page.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/presentation/signup_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_info.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            // SizedBox(height: 100.h),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "Masuk",
            //     style: AppTheme.theme.textTheme.headline2?.copyWith(
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 100.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Masuk",
                style: AppTheme.theme.textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            const AppTextFieldWidget(
              textFieldTitle: "Email",
              textFieldHintText: "journalist@email.com",
            ),
            SizedBox(height: 10.h),
            const AppTextFieldWidget(
              textFieldTitle: "Passoword",
              textFieldHintText: "*****",
            ),
            SizedBox(height: 20.h),
            AppMainButtonWidget(
              onPressed: () {
                Get.offAll(
                  () => const MainPage(),
                );
              },
              text: "Masuk",
            ),
            SizedBox(height: 20.h),
            Text("Belum Ada Akun?"),
            SizedBox(height: 20.h),
            AppMainButtonWidget(
              onPressed: () {
                Get.to(
                  () => const SignUpPage(),
                );
              },
              text: "Daftar",
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
