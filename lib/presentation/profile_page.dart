import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/signin_page.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.shape,
      appBar: AppBar(
        title: Text(
          "My Profile",
          textAlign: TextAlign.left,
          style: AppTheme.theme.textTheme.headline3?.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.h,
                    backgroundColor: AppColor.primary,
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "User name",
                    style: AppTheme.theme.textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 20.w),
                  Text("Useremail@email.com"),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 20.w),
                  Text("+6280811118080"),
                ],
              ),
              SizedBox(height: 35.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Akun",
                  style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("menus $index"),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1.h,
                      color: Colors.black26,
                    );
                  },
                ),
              ),
              SizedBox(height: 35.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tentang",
                  style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("menus $index"),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1.h,
                      color: Colors.black26,
                    );
                  },
                ),
              ),
              SizedBox(height: 35.h),
              InkWell(
                onTap: () {
                  Get.off(() => const SignInPage());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    "Keluar",
                    style: AppTheme.theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
