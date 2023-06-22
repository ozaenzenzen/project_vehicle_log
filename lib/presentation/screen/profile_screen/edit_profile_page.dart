import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.shape,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
            children: [
              SizedBox(height: 25.h),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(16.h),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 120.h,
                                width: 120.h,
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 50.h,
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "Change Image",
                                      textAlign: TextAlign.center,
                                      style: AppTheme.theme.textTheme.headline6?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 120.h,
                                width: 120.h,
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.image_search_outlined,
                                      size: 50.h,
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "See Image",
                                      textAlign: TextAlign.center,
                                      style: AppTheme.theme.textTheme.headline6?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // child: Text("Bottom Sheet"),
                      );
                    },
                  );
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.h,
                      backgroundColor: AppColor.primary,
                    ),
                    Positioned(
                      right: 10.h,
                      bottom: 10.h,
                      child: Icon(
                        Icons.edit_square,
                        color: AppColor.text_1,
                        size: 25.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              const AppTextFieldWidget(
                textFieldTitle: "Account Type",
                textFieldHintText: "ex: 250",
                ignorePointerActive: true,
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Name",
                textFieldHintText: "Name",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Email",
                textFieldHintText: "Email",
              ),
              SizedBox(height: 15.h),
              const AppTextFieldWidget(
                textFieldTitle: "Phone Number",
                textFieldHintText: "ex: 088811110808",
              ),
              SizedBox(height: 25.h),
              AppMainButtonWidget(
                onPressed: () {
                  // Get.off(() => const MainPage());
                },
                text: "Update Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
