import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/edit_profile/request/edit_profile_request_model.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:project_vehicle_log/presentation/widget/app_mainbutton_widget.dart';
import 'package:project_vehicle_log/presentation/widget/app_textfield_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_dialog_action.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late EditProfileBloc editProfileBloc;

  @override
  void initState() {
    super.initState();
    editProfileBloc = BlocProvider.of<EditProfileBloc>(context)
      ..add(
        GetProfileFromEditAction(
          accountLocalRepository: AccountLocalRepository(),
        ),
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    editProfileBloc = BlocProvider.of<EditProfileBloc>(context)
      ..add(
        GetProfileFromEditAction(
          accountLocalRepository: AccountLocalRepository(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc(AppAccountReposistory()),
      child: Scaffold(
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
        body: BlocBuilder<EditProfileBloc, EditProfileState>(
          bloc: editProfileBloc,
          builder: (context, state) {
            if (state is GetProfileFromEditSuccess) {
              nameController.text = state.accountDataUserModel.name ?? "";
              emailController.text = state.accountDataUserModel.email ?? "";
              phoneController.text = state.accountDataUserModel.phone ?? "";
              return SingleChildScrollView(
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
                      // const AppTextFieldWidget(
                      //   textFieldTitle: "Account Type",
                      //   textFieldHintText: "ex: 250",
                      //   ignorePointerActive: true,
                      // ),
                      SizedBox(height: 15.h),
                      AppTextFieldWidget(
                        textFieldTitle: "Name",
                        textFieldHintText: "Name",
                        controller: nameController,
                      ),
                      SizedBox(height: 15.h),
                      AppTextFieldWidget(
                        textFieldTitle: "Email",
                        textFieldHintText: "Email",
                        controller: emailController,
                      ),
                      SizedBox(height: 15.h),
                      AppTextFieldWidget(
                        textFieldTitle: "Phone Number",
                        textFieldHintText: "ex: 088811110808",
                        controller: phoneController,
                      ),
                      SizedBox(height: 25.h),
                      BlocConsumer<EditProfileBloc, EditProfileState>(
                        listener: (context, state) {
                          if (state is EditProfileFailed) {
                            AppDialogAction.showFailedPopup(
                              context: context,
                              title: "Terjadi Kesalahan",
                              description: "${state.errorMessage}",
                              buttonTitle: "Kembali",
                            );
                          } else if (state is EditProfileSuccess) {
                            AppDialogAction.showSuccessPopup(
                              context: context,
                              title: "Berhasil",
                              description: "${state.editProfileResponseModel.message}",
                              buttonTitle: "Kembali",
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is EditProfileLoading) {
                            return SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: const CircularProgressIndicator(),
                            );
                          }
                          return AppMainButtonWidget(
                            onPressed: () {
                              // Get.off(() => const MainPage());
                              context.read<EditProfileBloc>().add(
                                    EditProfileAction(
                                      editProfileRequestModel: EditProfileRequestModel(
                                        profilePicture: "nameController.",
                                        name: nameController.text,
                                      ),
                                    ),
                                  );
                              // BlocProvider(
                              //   create: (context) => EditProfileBloc(AppAccountReposistory())
                              //     ..add(
                              //       EditProfileAction(
                              //         editProfileRequestModel: EditProfileRequestModel(
                              //           profilePicture: "nameController.",
                              //           name: nameController.text,
                              //         ),
                              //       ),
                              //     ),
                              // );
                            },
                            text: "Update Profile",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is EditProfileFailed) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: Text("${state.errorMessage}"),
                    ),
                  ],
                ),
              );
            } else if (state is EditProfileLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: const CircularProgressIndicator(),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
