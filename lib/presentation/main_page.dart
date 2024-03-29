import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/home_screen/home_page.dart';
import 'package:project_vehicle_log/presentation/profile_screen/profile_page.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/add_vehicle_page.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/vehicle_page.dart';
import 'package:project_vehicle_log/presentation/stats_screen/stats_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_custom_appbar.dart';
import 'package:project_vehicle_log/support/app_color.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexClicked = 0;
  Color vehicleListColor = Colors.black38;

  PageController pageController = PageController(
    initialPage: 0,
  );

  void _selectedTab(int index) {
    // debugPrint("index masuk $index");
    if (index == 0) {
      indexClicked = 0;
      pageController.jumpToPage(
        0,
        // duration: const Duration(milliseconds: 300),
        // curve: Curves.ease,
      );
    } else if (index == 1) {
      indexClicked = 1;
      pageController.jumpToPage(
        1,
        // duration: const Duration(milliseconds: 300),
        // curve: Curves.ease,
      );
    } else if (index == 2) {
      indexClicked = 2;
      pageController.jumpToPage(
        2,
        // duration: const Duration(milliseconds: 300),
        // curve: Curves.ease,
      );
    } else {
      Get.to(() => const ProfilePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.shape,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddVehiclePage());
        },
        child: Icon(
          Icons.add_circle_outline_outlined,
          color: AppColor.white,
          size: 35.h,
        ),
        backgroundColor: AppColor.primary,
        elevation: 0,
      ),
      bottomNavigationBar: AppCustomAppBar(
        centerItemText: 'Add Vehicle',
        color: AppColor.white,
        selectedColor: AppColor.white,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: (index) {
          _selectedTab(index);
        },
        backgroundColor: AppColor.primary,
        iconSize: 25.h,
        fontSize: 14.sp,
        height: 80.h,
        currentIndex: indexClicked,
        items: [
          AppCustomAppBarItem(
            iconData: Icons.home,
            text: "Home",
          ),
          AppCustomAppBarItem(
            iconData: Icons.motorcycle,
            text: "Vehicle",
          ),
          AppCustomAppBarItem(
            iconData: Icons.bar_chart,
            text: "Stats",
          ),
          AppCustomAppBarItem(
            iconData: Icons.person,
            text: "Profile",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (currentPage) {
          // debugPrint("page now: $currentPage");
          setState(() {
            indexClicked = currentPage;
          });
          // setState(() {
          //   _selectedTab(currentPage);
          // });
        },
        children: const [
          HomePage(),
          VehiclePage(),
          StatsPage(),
        ],
      ),
    );
  }
}
