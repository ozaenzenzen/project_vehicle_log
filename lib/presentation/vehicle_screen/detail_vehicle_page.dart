import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/add_measurement_page.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/edit_main_info_page.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/list_item_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

enum StatusLogs { add, update, delete }

class DetailVehiclePage extends StatefulWidget {
  const DetailVehiclePage({Key? key}) : super(key: key);

  @override
  State<DetailVehiclePage> createState() => _DetailVehiclePageState();
}

class _DetailVehiclePageState extends State<DetailVehiclePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 3,
    );
  }

  TabBar get _tabBar => TabBar(
        // unselectedLabelColor: AppColor.disabled,
        controller: tabController,
        tabs: const [
          Tab(
            text: "Info",
            icon: Icon(Icons.info),
          ),
          Tab(
            text: "Logs",
            icon: Icon(Icons.list_rounded),
          ),
          Tab(
            text: "Stats",
            icon: Icon(Icons.legend_toggle_sharp),
          ),
        ],
      );

  infoView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name Vehicle",
              style: AppTheme.theme.textTheme.headline1?.copyWith(
                // color: AppColor.text_4,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              child: Image.network("https://media.istockphoto.com/id/1096052566/vector/stamprsimp2red.jpg?s=612x612&w=0&k=20&c=KVu0nVz7ZLbZsRsx81VBZcuXZ1MlEmLk9IQabO2GkYo="),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Main Info",
                  style: AppTheme.theme.textTheme.headline4?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const EditMainInfoPage());
                  },
                  child: Icon(
                    Icons.edit_square,
                    size: 25.h,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const ItemListWidget(
              title: "Year",
              value: "2015",
            ),
            SizedBox(height: 10.h),
            const ItemListWidget(
              title: "Engine Capacity (cc)",
              value: "250",
            ),
            SizedBox(height: 10.h),
            const ItemListWidget(
              title: "Tank Capacity (Litre)",
              value: "17",
            ),
            SizedBox(height: 10.h),
            const ItemListWidget(
              title: "Color",
              value: "Red",
            ),
            SizedBox(height: 10.h),
            const ItemListWidget(
              title: "Machine Number",
              value: "xxxxxxx",
            ),
            SizedBox(height: 10.h),
            const ItemListWidget(
              title: "Chassis Number",
              value: "xxxxxxx",
            ),
          ],
        ),
      ),
    );
  }

  logsView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Logs",
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
            SizedBox(height: 10.h),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 14,
              itemBuilder: (context, index) {
                return const ItemListWidget.logs(
                  title: "Oil",
                  statusLogs: StatusLogs.add,
                  value: "12000",
                );
              },
            ),
            SizedBox(height: 5.h),
            Center(
              child: Text(
                "See more",
                style: AppTheme.theme.textTheme.headline6?.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColor.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  statsView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
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
            SizedBox(height: 10.h),
            SizedBox(
              height: 250.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You haven't yet set measurement stats",
                    style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
                      // color: AppColor.text_4,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AppMainButtonWidget(
                    onPressed: () {
                      Get.to(() => const AddMeasurementPage());
                    },
                    text: "Add Now",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.shape,
      appBar: AppBar(
        title: Text(
          "Detail Vehicle Page",
          textAlign: TextAlign.left,
          style: AppTheme.theme.textTheme.headline3?.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: Container(
            // color: Colors.white,
            child: _tabBar,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          infoView(),
          logsView(),
          statsView(),
        ],
      ),
    );
  }
}
