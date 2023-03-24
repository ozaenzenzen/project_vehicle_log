import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_vehicle_log/presentation/main_page.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

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
    return ScreenUtilInit(
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
    );
  }
}
