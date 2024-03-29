import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';
import 'package:project_vehicle_log/presentation/edit_profile/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/presentation/profile_screen/profile_bloc/profile_bloc.dart';
import 'package:project_vehicle_log/presentation/profile_screen/signout_bloc/signout_bloc.dart';
import 'package:project_vehicle_log/presentation/signin/signin_bloc/signin_bloc.dart';
import 'package:project_vehicle_log/presentation/signup/signup_bloc/signup_bloc.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/vehicle_bloc/create_log_vehicle_bloc/create_log_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/vehicle_bloc/create_vehicle_bloc/create_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/vehicle_bloc/get_all_vehicle_bloc/get_all_vehicle_bloc.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/vehicle_bloc/get_log_vehicle_bloc/get_log_vehicle_bloc.dart';
import 'package:project_vehicle_log/support/app_theme.dart';
import 'package:project_vehicle_log/support/local_service.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'presentation/signin/signin_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isSignIn = false;
  @override
  Widget build(BuildContext context) {
    isSignIn = LocalService.instance.box.read("isSignIn");
    debugPrint("isSignIn $isSignIn");
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninBloc(AppAccountReposistory())),
        BlocProvider(create: (context) => SignoutBloc()),
        BlocProvider(create: (context) => SignupBloc(AppAccountReposistory())),
        BlocProvider(create: (context) => ProfileBloc(AccountLocalRepository())),
        BlocProvider(create: (context) => GetAllVehicleBloc(AppVehicleReposistory())),
        BlocProvider(create: (context) => GetLogVehicleBloc(AppVehicleReposistory())),
        BlocProvider(create: (context) => CreateVehicleBloc(AppVehicleReposistory())),
        BlocProvider(create: (context) => CreateLogVehicleBloc(AppVehicleReposistory())),
        BlocProvider(create: (context) => EditProfileBloc(AppAccountReposistory())),
      ],
      child: ScreenUtilInit(
        // designSize: const Size(360, 690),
        designSize: const Size(411, 869),
        // designSize: const Size(412, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          AppTheme.appThemeInit();
          return GetMaterialApp(
            title: 'Vehicle Management Log',
            theme: AppTheme.theme,
            // home: const MainPage()
            home: (isSignIn == true) ? const MainPage() : const SignInPage(),
          );
        },
      ),
    );
  }
}
