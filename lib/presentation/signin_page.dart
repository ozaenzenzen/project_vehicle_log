import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/model/account/signin_request_models.dart';
import 'package:project_vehicle_log/presentation/bloc/account_bloc/signin_bloc/signin_bloc.dart';
import 'package:project_vehicle_log/presentation/home_screen/home_page.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/presentation/signup_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_dialog_action.dart';
import 'package:project_vehicle_log/support/app_info.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailTextFieldController = TextEditingController(text: "");
  TextEditingController passwordTextFieldController = TextEditingController(text: "");
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
            AppTextFieldWidget(
              textFieldTitle: "Email",
              textFieldHintText: "journalist@email.com",
              controller: emailTextFieldController,
            ),
            SizedBox(height: 10.h),
            AppTextFieldWidget(
              textFieldTitle: "Passoword",
              textFieldHintText: "*****",
              controller: passwordTextFieldController,
            ),
            SizedBox(height: 20.h),
            BlocConsumer<SigninBloc, SigninState>(
              listener: (context, state) {
                if (state is SigninFailed) {
                  AppDialogAction.showPopup(
                    content: Text(state.errorMessage),
                    context: context,
                  );
                } else if (state is SigninSuccess) {
                  Get.offAll(
                    () => const MainPage(),
                  );
                }
              },
              builder: (context, state) {
                if (state is SigninLoading) {
                  return SizedBox(
                    height: 40.h,
                    width: 40.h,
                    child: const CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      AppMainButtonWidget(
                        onPressed: () {
                          context.read<SigninBloc>().add(
                                SigninAction(
                                  signInRequestModel: SignInRequestModel(
                                    email: emailTextFieldController.text,
                                    password: passwordTextFieldController.text,
                                  ),
                                ),
                              );
                          // Get.offAll(
                          //   () => const MainPage(),
                          // );
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
                    ],
                  );
                }
              },
            ),
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
