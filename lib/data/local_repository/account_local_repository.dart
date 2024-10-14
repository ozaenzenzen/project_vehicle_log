import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';
import 'package:project_vehicle_log/support/local_service.dart';

class AccountLocalRepository {
  Future<bool> removeLocalAccountData() async {
    try {
      var data = await LocalService.instance.box.read("userData");
      if (data != null) {
        await LocalService.instance.box.remove("userData");
        return true;
      } else {
        return false;
        // throw Exception("Error remove userData");
      }
    } catch (errorMessage) {
      return false;
      // throw Exception(errorMessage);
    }
  }

  // static Future<void> saveLocalAccountData({
  //   required AccountDataUserModel data,
  // }) async {
  //   await LocalService.instance.box.write("userData", jsonEncode(data.toJson()));
  //   debugPrint("[saveLocalAccountData] userData saved");
  // }

  // Future<AccountDataUserModel?> getLocalAccountData() async {
  //   try {
  //     String dataFromLocal = LocalService.instance.box.read("userData");
  //     AccountDataUserModel? userData = AccountDataUserModel.fromJson(jsonDecode(dataFromLocal));
  //     return userData;
  //   } catch (errorMessage) {
  //     return null;
  //   }
  // }

  static Future<void> saveLocalAccountDataV2({
    required UserDataEntity data,
  }) async {
    await LocalService.instance.box.write("userDataV2", jsonEncode(data.toJson()));
    debugPrint("[saveLocalAccountDataV2] userData saved");
  }

  Future<UserDataEntity?> getLocalAccountDataV2() async {
    try {
      String? dataFromLocal = LocalService.instance.box.read("userDataV2");
      if (dataFromLocal != null) {
        UserDataEntity? userData = UserDataEntity.fromJson(jsonDecode(dataFromLocal));
        return userData;
      } else {
        return null;
      }
    } catch (errorMessage) {
      return null;
    }
  }

  static Future<bool> isSignIn() async {
    bool? isAccountSignIn = LocalService.instance.box.read("isSignIn") ?? false;
    debugPrint("[isSignIn] data: $isAccountSignIn");
    return isAccountSignIn;
  }

  static Future<void> signInSaved() async {
    await LocalService.instance.box.write("isSignIn", true);
    debugPrint("[signInSaved] isSignIn ${LocalService.instance.box.read("isSignIn")}");
  }

  Future<void> signOutSaved() async {
    await LocalService.instance.box.write("isSignIn", false);
    debugPrint("[signOutSaved] isSignIn ${LocalService.instance.box.read("isSignIn")}");
  }

  static Future<void> isOnboardingDone() async {
    LocalService.instance.box.write('isOnboardingDone', true);
    debugPrint("[signOutSaved] isSignIn ${LocalService.instance.box.read("isSignIn")}");
  }
}
