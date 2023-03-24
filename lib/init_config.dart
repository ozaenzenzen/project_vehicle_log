import 'package:project_vehicle_log/support/app_connectivity_service.dart';
import 'package:project_vehicle_log/support/app_info.dart';
import 'package:project_vehicle_log/support/app_local_storage.dart';

class AppInitConfig {
  static Future<void> init() async {
    // AppTheme.appThemeInit();
    AppInfo.appInfoInit();
    AppConnectivityService.init();
    AppLocalStorage.init();
  }
}
