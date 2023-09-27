import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/dummy_data.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/local_repository/vehicle_local_repository.dart';
import 'package:project_vehicle_log/data/model/local/account_user_data_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';
import 'package:project_vehicle_log/data/vehicle_data_model.dart';
import 'package:project_vehicle_log/presentation/bloc/account_bloc/profile_bloc/profile_bloc.dart';
import 'package:project_vehicle_log/presentation/bloc/vehicle_bloc/get_all_vehicle_bloc/get_all_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/screen/home_screen/detail_measurement_page.dart';
import 'package:project_vehicle_log/presentation/screen/profile_screen/profile_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_container_box_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_loading_indicator.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int indexClicked = 0;
  Color vehicleListColor = Colors.black38;

  DateFormat formattedDate = DateFormat("dd MMM yyyy");

  PageController homeSectionPageController = PageController(
    initialPage: 0,
  );

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  late GetAllVehicleBloc getAllVehicleBloc;

  @override
  void initState() {
    getAllVehicleBloc = BlocProvider.of<GetAllVehicleBloc>(context)
      ..add(
        GetProfileDataVehicleAction(
          localRepository: AccountLocalRepository(),
        ),
      );
    data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      // _ChartData('Jack', 34),
      // _ChartData('Others', 52),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getAllVehicleBloc = BlocProvider.of<GetAllVehicleBloc>(context)
      ..add(
        GetProfileDataVehicleAction(
          localRepository: AccountLocalRepository(),
        ),
      );
    super.didChangeDependencies();
  }

  AccountDataUserModel? accountDataUserModelHomePage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllVehicleBloc, GetAllVehicleState>(
      bloc: getAllVehicleBloc,
      listener: (context, state) {
        if (state is GetProfileDataVehicleSuccess) {
          accountDataUserModelHomePage = state.accountDataUserModel;
          context.read<GetAllVehicleBloc>().add(
                // GetAllVehicleDataAction(
                //   id: state.accountDataUserModel.userId.toString(),
                // ),
                GetAllVehicleDataFromLocalAction(
                  vehicleLocalRepository: VehicleLocalRepository(),
                ),
              );
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<GetAllVehicleBloc>().add(
                GetAllVehicleDataAction(
                  id: accountDataUserModelHomePage!.userId.toString(),
                  vehicleLocalRepository: VehicleLocalRepository(),
                ),
                // GetAllVehicleDataFromLocalAction(
                //   vehicleLocalRepository: VehicleLocalRepository(),
                // ),
              );

          context.read<ProfileBloc>().add(
                GetProfileRemoteAction(
                  accountRepository: AppAccountReposistory(),
                ),
              );
        },
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            color: AppColor.shape,
            padding: EdgeInsets.all(16.h),
            alignment: Alignment.center,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 40.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  if (state is ProfileLoading) {
                                    return SizedBox(
                                      height: 40.h,
                                      width: 150.w,
                                      child: const SkeletonLine(),
                                    );
                                  } else if (state is ProfileFailed) {
                                    return Text(state.errorMessage);
                                  } else if (state is ProfileSuccess) {
                                    return Expanded(
                                      child: Text(
                                        "Hi, ${state.userDataModel.name}",
                                        style: AppTheme.theme.textTheme.headline1?.copyWith(
                                          // color: AppColor.text_4,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      "Hi, User",
                                      style: AppTheme.theme.textTheme.headline1?.copyWith(
                                        // color: AppColor.text_4,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  }
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const ProfilePage());
                                },
                                child: CircleAvatar(
                                  radius: 36.h,
                                  backgroundColor: AppColor.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            // "Update and measure your vehicle logs",
                            // "Update and measure your vehicle mileage",
                            "Manage your vehicle mileage",
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
                    BlocBuilder<GetAllVehicleBloc, GetAllVehicleState>(
                      builder: (context, state) {
                        if (state is GetAllVehicleFailed) {
                          return SizedBox(
                            child: Text(state.errorMessage),
                          );
                        } else if (state is GetAllVehicleLoading) {
                          return const Center(
                            child: AppLoadingIndicator(),
                          );
                        } else if (state is GetAllVehicleSuccess) {
                          if (state.getAllVehicleDataResponseModel.data!.isEmpty) {
                            return const Text("data is empty");
                          }
                          return Column(
                            children: [
                              AppContainerBoxWidget(
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
                                      SizedBox(height: 5.h),
                                      Text(
                                        "Critical: Oil, Water",
                                        style: AppTheme.theme.textTheme.bodySmall?.copyWith(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "Last Update: 16 Nov 2022",
                                        style: AppTheme.theme.textTheme.bodySmall?.copyWith(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 100.h,
                                            width: 100.h,
                                            child: SfCircularChart(
                                              tooltipBehavior: _tooltip,
                                              series: <CircularSeries<_ChartData, String>>[
                                                DoughnutSeries<_ChartData, String>(
                                                  dataSource: data,
                                                  xValueMapper: (_ChartData data, ints) => data.x,
                                                  yValueMapper: (_ChartData data, ints) => data.y,
                                                  name: 'Gold',
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 100.h,
                                            width: 100.h,
                                            child: SfCircularChart(
                                              tooltipBehavior: _tooltip,
                                              series: <CircularSeries<_ChartData, String>>[
                                                DoughnutSeries<_ChartData, String>(
                                                  dataSource: data,
                                                  xValueMapper: (_ChartData data, ints) => data.x,
                                                  yValueMapper: (_ChartData data, ints) => data.y,
                                                  name: 'Gold',
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 100.h,
                                            width: 100.h,
                                            child: SfCircularChart(
                                              tooltipBehavior: _tooltip,
                                              series: <CircularSeries<_ChartData, String>>[
                                                DoughnutSeries<_ChartData, String>(
                                                  dataSource: data,
                                                  xValueMapper: (_ChartData data, ints) => data.x,
                                                  yValueMapper: (_ChartData data, ints) => data.y,
                                                  name: 'Gold',
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SfCircularChart(
                                      //   series: <CircularSeries>[
                                      //     // Render pie chart
                                      //     PieSeries<ChartData, String>(
                                      //       dataSource: chartData,
                                      //       pointColorMapper: (ChartData data, _) => data.color,
                                      //       xValueMapper: (ChartData data, _) => data.x,
                                      //       yValueMapper: (ChartData data, _) => data.y,
                                      //     )
                                      //   ],
                                      // ),
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
                                  // itemCount: 8,
                                  // itemCount: DummyData.dummyData.length,
                                  itemCount: state.getAllVehicleDataResponseModel.data!.length,
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
                                          // "${DummyData.dummyData[index].vehicleName}",
                                          state.getAllVehicleDataResponseModel.data![index].vehicleName!,
                                          // "Menu $index",
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
                              // Container(
                              //   color: Colors.amber,
                              //   height: 10,
                              // ),
                              ListMeasurementWidget(
                                // data: DummyData.dummyData[indexClicked].listControl!,
                                // data: DummyData.dummyData[indexClicked],
                                data: state.getAllVehicleDataResponseModel.data![indexClicked],
                                index: indexClicked,
                              ),
                              // Container(
                              //   height: MediaQuery.of(context).size.height,
                              //   child: PageView.builder(
                              //     controller: homeSectionPageController,
                              //     itemCount: DummyData.dummyData.length,
                              //     itemBuilder: (context, index) {
                              //       return Container(
                              //         height: 40,
                              //         width: MediaQuery.of(context).size.width,
                              //         color: Colors.red,
                              //       );
                              //     },
                              //   ),
                              // ),
                            ],
                          );
                        } else {
                          return Container(
                            child: Text("data is empty"),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListMeasurementWidget extends StatelessWidget {
  // final List<String> data;
  // final VehicleDataModel data;
  final DatumVehicle data;
  final int index;

  const ListMeasurementWidget({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20.h,
        mainAxisSpacing: 20.h,
        crossAxisCount: 2,
      ),
      // itemCount: 6,
      // itemCount: DummyData.dummyData[0].listControl!.length,
      // itemCount: data.listControl?.length,
      // itemCount: data.vehicleMeasurementLogModels.length,
      itemCount: data.categorizedData!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(
              () => DetailMeasurementPage(
                // title: data.listControl![index],
                data: data,
                index: index,
              ),
            );
          },
          child: AppContainerBoxWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.water_drop,
                  size: 90.h,
                  color: AppColor.primary,
                ),
                SizedBox(height: 10.h),
                Text(
                  // "Oil",
                  // data.listControl![index],
                  // data.vehicleMeasurementLogModels[index].measurementTitle,
                  data.categorizedData![index].measurementTitle!,
                  style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y, [
    this.color,
  ]);
  final String x;
  final double y;
  final Color? color;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
