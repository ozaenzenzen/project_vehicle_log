import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/local_repository/vehicle_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/presentation/bloc/vehicle_bloc/get_all_vehicle_bloc/get_all_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/screen/vehicle_screen/add_measurement_page.dart';
import 'package:project_vehicle_log/presentation/screen/vehicle_screen/dvp_stats_item_widget.dart';
import 'package:project_vehicle_log/presentation/screen/vehicle_screen/edit_main_info_page.dart';
import 'package:project_vehicle_log/presentation/screen/vehicle_screen/list_item_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_loading_indicator.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum StatusLogs { add, update, delete }

class DetailVehiclePage extends StatefulWidget {
  final int index;
  final DatumVehicle datumVehicle;

  const DetailVehiclePage({
    Key? key,
    required this.index,
    required this.datumVehicle,
  }) : super(key: key);

  @override
  State<DetailVehiclePage> createState() => _DetailVehiclePageState();
}

class _DetailVehiclePageState extends State<DetailVehiclePage> with TickerProviderStateMixin {
  late TabController tabController;

  TooltipBehavior? _tooltipBehavior;

  late GetAllVehicleBloc getAllVehicleBloc;

  @override
  void initState() {
    super.initState();
    getAllVehicleBloc = BlocProvider.of(context)
      ..add(
        GetAllVehicleDataFromLocalAction(
          vehicleLocalRepository: VehicleLocalRepository(),
        ),
      );
    _tooltipBehavior = TooltipBehavior(enable: true);
    tabController = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  void didChangeDependencies() {
    getAllVehicleBloc = BlocProvider.of(context)
      ..add(
        GetAllVehicleDataFromLocalAction(
          vehicleLocalRepository: VehicleLocalRepository(),
        ),
      );
    super.didChangeDependencies();
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
    return BlocBuilder<GetAllVehicleBloc, GetAllVehicleState>(
      bloc: getAllVehicleBloc,
      builder: (context, state) {
        if (state is GetAllVehicleLoading) {
          return const AppLoadingIndicator();
        } else if (state is GetAllVehicleFailed) {
          return Text(state.errorMessage);
        } else if (state is GetAllVehicleSuccess) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Name Vehicle",
                    state.getAllVehicleDataResponseModel.data![widget.index].vehicleName,
                    style: AppTheme.theme.textTheme.headline1?.copyWith(
                      // color: AppColor.text_4,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    // child: Image.network("https://media.istockphoto.com/id/1096052566/vector/stamprsimp2red.jpg?s=612x612&w=0&k=20&c=KVu0nVz7ZLbZsRsx81VBZcuXZ1MlEmLk9IQabO2GkYo="),
                    child: Image.network("https://play-lh.googleusercontent.com/1-hPxafOxdYpYZEOKzNIkSP43HXCNftVJVttoo4ucl7rsMASXW3Xr6GlXURCubE1tA=w3840-h2160-rw"),
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
                  ItemListWidget(
                    title: "Year",
                    value: state.getAllVehicleDataResponseModel.data![widget.index].year,
                  ),
                  SizedBox(height: 10.h),
                  ItemListWidget(
                    title: "Engine Capacity (cc)",
                    value: state.getAllVehicleDataResponseModel.data![widget.index].engineCapacity,
                  ),
                  SizedBox(height: 10.h),
                  ItemListWidget(
                    title: "Tank Capacity (Litre)",
                    value: state.getAllVehicleDataResponseModel.data![widget.index].tankCapacity,
                  ),
                  SizedBox(height: 10.h),
                  ItemListWidget(
                    title: "Color",
                    value: state.getAllVehicleDataResponseModel.data![widget.index].color,
                  ),
                  SizedBox(height: 10.h),
                  ItemListWidget(
                    title: "Machine Number",
                    value: state.getAllVehicleDataResponseModel.data![widget.index].machineNumber,
                  ),
                  SizedBox(height: 10.h),
                  ItemListWidget(
                    title: "Chassis Number",
                    value: state.getAllVehicleDataResponseModel.data![widget.index].chassisNumber,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text("data is null");
        }
      },
    );
  }

  logsView() {
    return BlocBuilder<GetAllVehicleBloc, GetAllVehicleState>(
      bloc: getAllVehicleBloc,
      builder: (context, state) {
        if (state is GetAllVehicleLoading) {
          return const AppLoadingIndicator();
        } else if (state is GetAllVehicleFailed) {
          return Text(state.errorMessage);
        } else if (state is GetAllVehicleSuccess) {
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
                      // Icon(
                      //   Icons.edit_square,
                      //   size: 25.h,
                      //   color: AppColor.primary,
                      // ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.getAllVehicleDataResponseModel.data![widget.index].vehicleMeasurementLogModels.length,
                    itemBuilder: (context, index) {
                      return ItemListWidget.logs(
                        title: state.getAllVehicleDataResponseModel.data![widget.index].vehicleMeasurementLogModels[index].measurementTitle,
                        statusLogs: StatusLogs.add,
                        vehicleMeasurementLogModels: state.getAllVehicleDataResponseModel.data![widget.index].vehicleMeasurementLogModels[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10.h);
                    },
                  ),
                  // SizedBox(height: 5.h),
                  // Center(
                  //   child: Text(
                  //     "See more",
                  //     style: AppTheme.theme.textTheme.headline6?.copyWith(
                  //       decoration: TextDecoration.underline,
                  //       color: AppColor.blue,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        } else {
          return Text("data is null");
        }
      },
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
                // Icon(
                //   Icons.edit_square,
                //   size: 25.h,
                //   color: AppColor.primary,
                // ),
              ],
            ),
            SizedBox(height: 10.h),
            emptyState(),
            SizedBox(height: 10.h),
            const DVPStatsItemWidget(
              title: "Oil",
            ),
            SizedBox(height: 10.h),
            const DVPStatsItemWidget(
              title: "Radiator",
            ),
            SizedBox(height: 10.h),
            const DVPStatsItemWidget(
              title: "Side Oil",
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyState() {
    return SizedBox(
      height: 250.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You haven't yet set measurement",
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              // color: AppColor.text_4,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          AppMainButtonWidget(
            onPressed: () {
              Get.to(() => AddMeasurementPage(
                vehicleId: widget.datumVehicle.id,
              ));
            },
            text: "Add Now",
          ),
        ],
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
