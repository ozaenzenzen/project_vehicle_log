import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/add_vehicle_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_custom_appbar.dart';
import 'package:project_vehicle_log/presentation/profile_page.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexClicked = 0;
  Color vehicleListColor = Colors.black38;

  DateFormat formattedDate = DateFormat("dd MMM yyyy");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Container(
        color: AppColor.shape,
        padding: EdgeInsets.all(16.h),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, User",
                        style: AppTheme.theme.textTheme.headline1?.copyWith(
                          // color: AppColor.text_4,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const ProfilePage());
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Update your vehicle logs",
                    style: AppTheme.theme.textTheme.headline4?.copyWith(
                      // color: AppColor.text_4,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Current Date: ${formattedDate.format(DateTime.now())}",
                    style: AppTheme.theme.textTheme.headline6?.copyWith(
                      // color: AppColor.text_4,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 9,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: AppTheme.theme.textTheme.headline5?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Number of Vehicle: 8",
                      style: AppTheme.theme.textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "Critical: Oil, Water",
                      style: AppTheme.theme.textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "Last Update: 16 Nov 2022",
                      style: AppTheme.theme.textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        debugPrint("test hit $index");
                        indexClicked = index;
                        vehicleListColor = AppColor.white;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                      ),
                      decoration: BoxDecoration(
                        color: index == indexClicked ? AppColor.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Menu $index",
                        style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                          // color: AppColor.text_4,
                          // color: Colors.black38,
                          color: index == indexClicked ? AppColor.white : Colors.black38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20.h,
                mainAxisSpacing: 20.h,
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //
                  },
                  child: Container(
                    // height: 150.h,
                    // width: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 9,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop,
                          size: 90.h,
                          color: AppColor.primary,
                        ),
                        SizedBox(height: 10.h),
                        Text("Oil")
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
