import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';
import 'package:project_vehicle_log/support/app_logger.dart';
import 'package:project_vehicle_log/support/local_service.dart';

class AccountLocalRepository {
  String userDataV2 = "userDataV2";
  String isSignIn = "isSignIn";
  String isOnboardingDone = "isOnboardingDone";

  Future<void> removeLocalAccountData() async {
    try {
      await LocalService.instance.box.remove(userDataV2);
    } catch (errorMessage) {
      AppLogger.debugLog("[removeLocalAccountData][error] $errorMessage");
      rethrow;
    }
  }

  Future<void> setLocalAccountData({
    required UserDataEntity data,
  }) async {
    try {
      await LocalService.instance.box.write(
        userDataV2,
        jsonEncode(data.toJson()),
      );
      debugPrint("[saveLocalAccountData] userData saved");
    } catch (errorMessage) {
      AppLogger.debugLog("[saveLocalAccountData][error] $errorMessage");
      rethrow;
    }
  }

  Future<UserDataEntity?> getLocalAccountData() async {
    try {
      String? dataFromLocal = LocalService.instance.box.read(userDataV2);
      if (dataFromLocal != null) {
        UserDataEntity? userData = UserDataEntity.fromJson(jsonDecode(dataFromLocal));
        return userData;
      } else {
        return null;
      }
    } catch (errorMessage) {
      AppLogger.debugLog("[getLocalAccountData][error] $errorMessage");
      return null;
    }
  }

  Future<bool?> getIsSignIn() async {
    try {
      bool? result = LocalService.instance.box.read(isSignIn);
      if (result != null) {
        debugPrint("[getIsSignIn] data: $result");
        return result;
      } else {
        return false;
      }
    } catch (errorMessage) {
      AppLogger.debugLog("[getIsSignIn][error] $errorMessage");
      return false;
    }
  }

  Future<void> setIsSignIn() async {
    try {
      await LocalService.instance.box.write(isSignIn, true);
      debugPrint("[setIsSignIn] isSignIn ${LocalService.instance.box.read(isSignIn)}");
    } catch (errorMessage) {
      AppLogger.debugLog("[setIsSignIn][error] $errorMessage");
      rethrow;
    }
  }

  Future<void> setIsSignOut() async {
    try {
      await LocalService.instance.box.write(isSignIn, false);
      debugPrint("[setIsSignOut] isSignIn ${LocalService.instance.box.read(isSignIn)}");
    } catch (errorMessage) {
      AppLogger.debugLog("[setIsSignOut][error] $errorMessage");
      rethrow;
    }
  }

  Future<void> setIsOnboardingDone() async {
    try {
      await LocalService.instance.box.write(isOnboardingDone, true);
      debugPrint("[setIsOnboardingDone] isSignIn ${LocalService.instance.box.read(isSignIn)}");
    } catch (errorMessage) {
      AppLogger.debugLog("[setIsOnboardingDone][error] $errorMessage");
      rethrow;
    }
  }
}
