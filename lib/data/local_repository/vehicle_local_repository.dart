import 'package:flutter/material.dart';
import 'package:project_vehicle_log/data/model/local/vehicle_local_data_model.dart';
import 'package:project_vehicle_log/support/local_service.dart';

class VehicleLocalRepository {
  static Future<bool> removeLocalVehicleData() async {
    try {
      var data = await LocalService.instance.box.read("vehicleData");
      if (data != null) {
        await LocalService.instance.box.remove("vehicleData");
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

  static Future<void> saveLocalVehicleData({
    required VehicleLocalDataModel data,
  }) async {
    await LocalService.instance.box.write("vehicleData", data.toJson());
    debugPrint("[saveLocalVehicleData] vehicleData saved");
  }

  Future<VehicleLocalDataModel> getLocalVehicleData() async {
    try {
      VehicleLocalDataModel? vehicleData = VehicleLocalDataModel.fromJson(
        LocalService.instance.box.read("vehicleData"),
      );
      // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
      if (vehicleData == null || vehicleData == [] || vehicleData == "") {
        return VehicleLocalDataModel();
        // throw Exception("User data is empty");
      } else {
        return vehicleData;
      }
    } catch (errorMessage) {
      throw Exception(errorMessage);
    }
  }
}
