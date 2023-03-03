import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static Future<void> appInfoInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    packageInfo;
  }
}
