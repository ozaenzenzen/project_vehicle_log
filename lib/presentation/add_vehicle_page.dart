import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/account_user_data_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/create_vehicle_request_model.dart';
import 'package:project_vehicle_log/presentation/bloc/vehicle_bloc/create_vehicle_bloc/create_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/bloc/vehicle_bloc/get_all_vehicle_bloc/get_all_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_loading_indicator.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_dialog_action.dart';
import 'package:project_vehicle_log/support/app_image_picker.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  String imagePickedInBase64 = "";
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController engineCapacityController = TextEditingController();
  TextEditingController tankCapacityController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController machineNumberController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();

  AccountDataUserModel? accountDataUserModel;

  @override
  Widget build(BuildContext context) {
    context.read<GetAllVehicleBloc>().add(
          GetProfileDataVehicleAction(
            localRepository: AccountLocalRepository(),
          ),
        );
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Vehicle",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Vehicle",
                  style: AppTheme.theme.textTheme.headline1?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Add your vehicle alongside with measurement parameter",
                  style: AppTheme.theme.textTheme.headline5?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Vehicle Image",
                  style: AppTheme.theme.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff331814),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () async {
                    imagePickedInBase64 = await AppImagePickerService.getImageAsBase64().then(
                      (value) {
                        setState(() {});
                        return value;
                      },
                    );
                  },
                  child: (imagePickedInBase64 == "")
                      ? DottedBorder(
                          radius: const Radius.circular(20),
                          dashPattern: const [7, 3],
                          strokeWidth: 2,
                          color: AppColor.blue,
                          child: Container(
                            height: 200.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColor.border,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  size: 24.h,
                                  color: AppColor.blue,
                                ),
                                SizedBox(width: 18.h),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Browse File",
                                      style: AppTheme.theme.textTheme.headline4?.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.blue,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "Format dokumen .jpg",
                                      style: AppTheme.theme.textTheme.headline5?.copyWith(
                                        color: AppColor.disabled,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.h),
                                    // borderRadius: BorderRadius.only(
                                    //   topLeft: Radius.circular(8.h),
                                    //   topRight: Radius.circular(8.h),
                                    // ),
                                    child: Image.memory(
                                      base64Decode(base64.normalize(imagePickedInBase64)),
                                      height: 190.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10.h,
                                  right: 10.h,
                                  child: InkWell(
                                    onTap: () {
                                      debugPrint("Test ontap");
                                      setState(() {
                                        imagePickedInBase64 = "";
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 30.h,
                                          width: 30.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(0.65),
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            size: 25.h,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Vehicle Name",
                  textFieldHintText: "Vehicle Name",
                  controller: vehicleNameController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Year",
                  textFieldHintText: "Year",
                  controller: yearController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Engine Capacity (cc)",
                  textFieldHintText: "ex: 250",
                  controller: engineCapacityController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Tank Capacity (Litre)",
                  textFieldHintText: "ex: 250",
                  controller: tankCapacityController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Color",
                  textFieldHintText: "Color",
                  controller: colorController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Machine Number",
                  textFieldHintText: "Machine Number",
                  controller: machineNumberController,
                ),
                SizedBox(height: 15.h),
                AppTextFieldWidget(
                  textFieldTitle: "Chassis Number",
                  textFieldHintText: "Chassis Number",
                  controller: chassisNumberController,
                ),
                SizedBox(height: 20.h),
                BlocConsumer<CreateVehicleBloc, CreateVehicleState>(
                  listener: (context, state) {
                    if (state is CreateVehicleFailed) {
                      AppDialogAction.showMainPopup(
                        context: context,
                        title: "Error",
                        content: Text(state.errorMessage),
                        mainButtonAction: () {
                          Get.back();
                        },
                      );
                    } else if (state is CreateVehicleSuccess) {
                      Get.off(() => const MainPage());
                    }
                  },
                  builder: (context, state) {
                    if (state is CreateVehicleLoading) {
                      return const Center(
                        child: AppLoadingIndicator(),
                      );
                    }
                    return BlocBuilder<GetAllVehicleBloc, GetAllVehicleState>(
                      builder: (context, state) {
                        if (state is GetProfileDataVehicleSuccess) {
                          return AppMainButtonWidget(
                            onPressed: () {
                              context.read<CreateVehicleBloc>().add(
                                    CreateVehicleAction(
                                      createVehicleRequestModel: CreateVehicleRequestModel(
                                        userId: state.accountDataUserModel.userId!,
                                        vehicleName: vehicleNameController.text,
                                        vehicleImage: imagePickedInBase64,
                                        year: yearController.text,
                                        engineCapacity: engineCapacityController.text,
                                        tankCapacity: tankCapacityController.text,
                                        color: colorController.text,
                                        machineNumber: machineNumberController.text,
                                        chassisNumber: chassisNumberController.text,
                                      ),
                                    ),
                                  );
                            },
                            text: "Add Vehicle",
                          );
                        } else if (state is GetAllVehicleFailed) {
                          return Text("Failed to get profile data");
                        } else {
                          return AppMainButtonWidget(
                            onPressed: () {
                              //
                            },
                            text: "Add Vehicle",
                          );
                        }
                      },
                    );
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
