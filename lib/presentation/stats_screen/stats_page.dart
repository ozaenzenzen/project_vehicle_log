import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/local_repository/vehicle_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/presentation/home_screen/detail_measurement_page.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/vehicle_bloc/get_all_vehicle_bloc/get_all_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/widget/app_container_box_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_loading_indicator.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  // String? dropDownValue = DummyData.dummyData.first.vehicleName;
  // VehicleDataModel dropDownValue = DummyData.dummyData.first;
  List<DatumVehicle>? dataStats;
  // String? dropDownValue = "";
  DatumVehicle? dropDownValue;
  int indexChosen = 0;

  FocusNode dropDownFocusNode = FocusNode();

  late GetAllVehicleBloc getAllVehicleBloc;

  @override
  void initState() {
    getAllVehicleBloc = BlocProvider.of(context)
      ..add(
        GetAllVehicleDataFromLocalAction(
          vehicleLocalRepository: VehicleLocalRepository(),
        ),
      );
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dropDownFocusNode.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Stats",
                style: AppTheme.theme.textTheme.displayLarge?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Show stats based on your vehicle",
                style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              BlocListener<GetAllVehicleBloc, GetAllVehicleState>(
                bloc: getAllVehicleBloc,
                listener: (context, state) {
                  // debugPrint("listen something $state");
                  if (state is GetAllVehicleSuccess) {
                    if (state.getAllVehicleDataResponseModel.data!.isEmpty) {
                      dropDownValue = null;
                    } else {
                      dropDownValue = state.getAllVehicleDataResponseModel.data!.first;
                    }
                  }
                },
                child: BlocBuilder<GetAllVehicleBloc, GetAllVehicleState>(
                  builder: (context, state) {
                    if (state is GetAllVehicleLoading) {
                      return const Center(
                        child: AppLoadingIndicator(),
                      );
                    } else if (state is GetAllVehicleFailed) {
                      return Text(state.errorMessage);
                    } else if (state is GetAllVehicleSuccess) {
                      if (state.getAllVehicleDataResponseModel.data!.isEmpty) {
                        return const Text("data is empty");
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<DatumVehicle>(
                            focusNode: dropDownFocusNode,
                            items: state.getAllVehicleDataResponseModel.data?.map((DatumVehicle e) {
                              return DropdownMenuItem<DatumVehicle>(
                                value: e,
                                child: Text(
                                  e.vehicleName ?? "",
                                  style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              debugPrint("on changed $value");
                              setState(() {
                                dropDownValue = value;
                              });
                              dropDownFocusNode.unfocus();
                            },
                            // value: dropDownValue,
                            value: state.getAllVehicleDataResponseModel.data!.first,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          ListView.separated(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // itemCount: DummyData
                            //     .dummyData[DummyData.dummyData.indexWhere((element) {
                            //   return element.vehicleName == dropDownValue;
                            // })]
                            //     .listControl!
                            //     .length,
                            itemCount: state
                                .getAllVehicleDataResponseModel
                                .data![(state.getAllVehicleDataResponseModel.data!.indexWhere((element) {
                                          return element == dropDownValue;
                                        }) <
                                        0)
                                    ? 0
                                    : state.getAllVehicleDataResponseModel.data!.indexWhere((element) {
                                        return element == dropDownValue;
                                      })]
                                .categorizedData!
                                .length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Get.to(
                                  //   () => DetailMeasurementPage(
                                  //     data: DummyData.dummyData[DummyData.dummyData.indexWhere((element) {
                                  //       return element.vehicleName == dropDownValue;
                                  //     })],
                                  //     index: index,
                                  //   ),
                                  // );
                                  Get.to(
                                    () => DetailMeasurementPage(
                                      // data: state.getAllVehicleDataResponseModel.data![index],
                                      data: state.getAllVehicleDataResponseModel.data![(state.getAllVehicleDataResponseModel.data!.indexWhere((DatumVehicle element) {
                                                return element == dropDownValue;
                                              }) <
                                              0)
                                          ? 0
                                          : state.getAllVehicleDataResponseModel.data!.indexWhere((DatumVehicle element) {
                                              return element == dropDownValue;
                                            })],
                                      index: index,
                                    ),
                                  );
                                },
                                child: AppContainerBoxWidget(
                                  height: 200.h,
                                  child: Center(
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
                                          // DummyData
                                          //     .dummyData[DummyData.dummyData.indexWhere((element) {
                                          //   return element.vehicleName == dropDownValue;
                                          // })]
                                          //     .listControl![index],
                                          state
                                              .getAllVehicleDataResponseModel
                                              .data![(state.getAllVehicleDataResponseModel.data!.indexWhere((DatumVehicle element) {
                                                        return element == dropDownValue;
                                                      }) <
                                                      0)
                                                  ? 0
                                                  : state.getAllVehicleDataResponseModel.data!.indexWhere((DatumVehicle element) {
                                                      return element == dropDownValue;
                                                    })]
                                              .categorizedData![index]
                                              .measurementTitle!,
                                          style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // child: Text(
                                    //   DummyData.dummyData[0].listControl![index],
                                    //   style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                                    //     // color: AppColor.text_4,
                                    //     color: Colors.black38,
                                    //     fontWeight: FontWeight.w500,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 20.h);
                            },
                          ),
                        ],
                      );
                    } else {
                      return const Text("data is null");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
