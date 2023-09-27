import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/dummy_data_profile.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/local_repository/vehicle_local_repository.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/presentation/bloc/account_bloc/profile_bloc/profile_bloc.dart';
import 'package:project_vehicle_log/presentation/bloc/account_bloc/signout_bloc/signout_bloc.dart';
import 'package:project_vehicle_log/presentation/screen/notification_screen/notification_page.dart';
import 'package:project_vehicle_log/presentation/screen/profile_screen/edit_profile_page.dart';
import 'package:project_vehicle_log/presentation/signin_page.dart';
import 'package:project_vehicle_log/presentation/widget/app_loading_indicator.dart';
import 'package:project_vehicle_log/presentation/widget/app_webview_screen.dart';
import 'package:project_vehicle_log/presentation/widget/appbar_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_dialog_action.dart';
import 'package:project_vehicle_log/support/app_info.dart';
import 'package:project_vehicle_log/support/app_theme.dart';
import 'package:skeletons/skeletons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc profileBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileBloc = ProfileBloc(AccountLocalRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc
        ..add(
          GetProfileRemoteAction(
            accountRepository: AppAccountReposistory(),
          ),
        ),
      child: Scaffold(
        backgroundColor: AppColor.shape,
        appBar: AppBarWidget(
          title: 'My Profile',
          onBack: () {
            Get.back();
          },
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => const NotificationPage());
              },
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: const Icon(
                  Icons.notifications_active,
                ),
              ),
            ),
          ],
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
                                    onTap: () {
                                      Get.back();
                                      Get.to(() => EditProfilePage(
                                            callbackAction: () {
                                              //
                                            },
                                          ));
                                    },
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
                      child: CircleAvatar(
                        radius: 40.h,
                        backgroundColor: AppColor.primary,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<ProfileBloc, ProfileState>(
                            bloc: context.watch<ProfileBloc>(),
                            builder: (context, state) {
                              if (state is ProfileLoading) {
                                return SizedBox(
                                  height: 20.h,
                                  width: 150.w,
                                  child: const SkeletonLine(),
                                );
                              } else if (state is ProfileSuccess) {
                                return Text(
                                  "${state.userDataModel.name}",
                                  style: AppTheme.theme.textTheme.headline2?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              } else {
                                return Text(
                                  "User name",
                                  style: AppTheme.theme.textTheme.headline2?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 5.h),
                          InkWell(
                            onTap: () {
                              Get.to(() => EditProfilePage(
                                    callbackAction: () {
                                      debugPrint('panggil');
                                      context.read<ProfileBloc>().add(
                                            GetProfileRemoteAction(
                                              accountRepository: AppAccountReposistory(),
                                            ),
                                          );
                                    },
                                  ));
                            },
                            child: Text(
                              "Edit Profile",
                              style: AppTheme.theme.textTheme.headline6?.copyWith(
                                color: AppColor.text_4,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                BlocBuilder<ProfileBloc, ProfileState>(
                  bloc: context.watch<ProfileBloc>(),
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return SizedBox(
                        height: 15.h,
                        child: const SkeletonLine(),
                      );
                    } else if (state is ProfileSuccess) {
                      return Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 25.h,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "${state.userDataModel.email}",
                            style: AppTheme.theme.textTheme.headlineMedium?.copyWith(),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 25.h,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "Useremail@email.com",
                            style: AppTheme.theme.textTheme.headlineMedium?.copyWith(),
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 20.h),
                BlocBuilder<ProfileBloc, ProfileState>(
                  bloc: context.watch<ProfileBloc>(),
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return SizedBox(
                        height: 15.h,
                        child: const SkeletonLine(),
                      );
                    } else if (state is ProfileSuccess) {
                      return Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 25.h,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "+62${state.userDataModel.phone}",
                            style: AppTheme.theme.textTheme.headlineMedium?.copyWith(),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 25.h,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "+6280811118080",
                            style: AppTheme.theme.textTheme.headlineMedium?.copyWith(),
                          ),
                        ],
                      );
                    }
                  },
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
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    // itemCount: 5,
                    itemCount: ProfileDummyDataAccount.dummyDataProfileAccount.length,
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
                              Text(
                                // "menus $index",
                                "${ProfileDummyDataAccount.dummyDataProfileAccount[index].menuTitle}",
                                style: AppTheme.theme.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
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
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    // itemCount: 3,
                    itemCount: ProfileDummyDataAbout.dummyDataProfileAbout.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 2) {
                            Get.to(
                              () => const AppWebViewScreen(
                                title: "Terms & Conditions",
                                linkUrl: "https://www.google.com/",
                              ),
                            );
                          } else if (index == 3) {
                            Get.to(
                              () => const AppWebViewScreen(
                                title: "Privacy & Policy",
                                linkUrl: "https://fauzanlab.netlify.app/",
                              ),
                            );
                            //
                          } else {
                            //
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                // "menus $index",
                                "${ProfileDummyDataAbout.dummyDataProfileAbout[index].menuTitle}",
                                style: AppTheme.theme.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
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
                BlocConsumer<SignoutBloc, SignoutState>(
                  listener: (context, state) {
                    if (state is SignoutFailed) {
                      AppDialogAction.showMainPopup(
                        context: context,
                        title: "Error",
                        content: Text(state.errorMessage),
                        mainButtonAction: () {
                          Get.back();
                        },
                      );
                    } else if (state is SignoutSuccess) {
                      Get.offAll(() => const SignInPage());
                    }
                  },
                  builder: (context, state) {
                    if (state is SignoutLoading) {
                      return const Center(
                        child: AppLoadingIndicator(),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        context.read<SignoutBloc>().add(SignoutAction(
                              accountLocalRepository: AccountLocalRepository(),
                              vehicleLocalRepository: VehicleLocalRepository(),
                            ));
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
                    );
                  },
                ),
                SizedBox(height: 35.h),
                Center(
                  child: FutureBuilder(
                    future: AppInfo.showAppVersion(),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                        style: AppTheme.theme.textTheme.headline6?.copyWith(
                          color: AppColor.primary.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
