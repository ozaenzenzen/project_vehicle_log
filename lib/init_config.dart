import 'package:get_storage/get_storage.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_connectivity_service.dart';
import 'package:project_vehicle_log/support/app_info.dart';
import 'package:project_vehicle_log/support/app_local_storage.dart';

class AppInitConfig {
  static Future<void> init() async {
    // AppTheme.appThemeInit();
    await GetStorage.init();
    AppInfo.appInfoInit();
    AppConnectivityService.init();
    AppLocalStorage.init();
    EnvironmentConfig.customBaseUrl = "https://46ad-140-213-9-53.ngrok.io"; // for ngrok
    // EnvironmentConfig.customBaseUrl = "http://10.0.2.2:8080"; // for emulator android
    // EnvironmentConfig.customBaseUrl = "http://localhost:8080"; // for emulator iOS
  }
}
