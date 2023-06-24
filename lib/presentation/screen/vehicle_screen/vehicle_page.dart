import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/dummy_data.dart';
import 'package:project_vehicle_log/data/account_local_repository.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';
import 'package:project_vehicle_log/presentation/bloc/vehicle_bloc/get_all_vehicle_bloc/get_all_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/screen/vehicle_screen/detail_vehicle_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_loading_indicator.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllVehicleBloc(AppVehicleReposistory())
        ..add(
          GetProfileDataVehicleAction(localRepository: AccountLocalRepository()),
        ),
      child: BlocListener<GetAllVehicleBloc, GetAllVehicleState>(
        listener: (context, state) {
          if (state is GetProfileDataVehicleSuccess) {
            context.read<GetAllVehicleBloc>().add(
                  GetAllVehicleDataAction(
                    id: state.accountDataUserModel.userId.toString(),
                  ),
                );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.shape,
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  "Your Vehicle",
                  style: AppTheme.theme.textTheme.headline1?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Choose your vehicle",
                  style: AppTheme.theme.textTheme.headline5?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
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
                        return Container(
                          child: Text("data is empty"),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        // itemCount: 8,
                        // itemCount: DummyData.dummyData.length,
                        itemCount: state.getAllVehicleDataResponseModel.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => const DetailVehiclePage());
                            },
                            child: Container(
                              // height: 120.h,
                              padding: EdgeInsets.all(16.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 40.h,
                                    backgroundColor: AppColor.primary,
                                  ),
                                  SizedBox(width: 25.w),
                                  Column(
                                    children: [
                                      Text(
                                        // "${DummyData.dummyData[index].vehicleName}",
                                        state.getAllVehicleDataResponseModel.data![index].vehicleName,
                                        // "Vehicle $index",
                                        style: AppTheme.theme.textTheme.headlineMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
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
          ),
        ),
      ),
    );
  }
}
