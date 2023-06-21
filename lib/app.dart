import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/bloc/account_bloc/signin_bloc/signin_bloc.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

import 'presentation/bloc/account_bloc/profile_bloc/profile_bloc.dart';
import 'presentation/bloc/account_bloc/signout_bloc/signout_bloc.dart';
import 'presentation/bloc/account_bloc/signup_bloc/signup_bloc.dart';
import 'presentation/signin_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninBloc()),
        BlocProvider(create: (context) => SignoutBloc()),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
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
            home: const SignInPage(),
          );
        },
      ),
    );
  }
}
