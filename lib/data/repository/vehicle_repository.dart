import 'package:dio/dio.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_log_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_log_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/edit_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/edit_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_log_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_api_path.dart';
import 'package:project_vehicle_log/support/app_api_service.dart';

class AppVehicleReposistory {
  Future<GetAllVehicleDataResponseModel?> getAllVehicleData(String token) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.getAllVehicle,
        method: MethodRequest.get,
        header: {"token": token},
      );
      return GetAllVehicleDataResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return GetAllVehicleDataResponseModel(
        status: e.response?.data['status'],
        message: e.response?.data['Message'],
      );
      // if (e.response?.data is Map) {
      //   return DataState.error(
      //     exception: e,
      //     stackTrace: e.stackTrace,
      //     message: e.response?.data['Message'] ?? "Error",
      //     code: int.tryParse('${e.response?.data['StatusCode']}'),
      //   );
      // }
    } catch (errorMessage) {
      return null;
    }
  }

  Future<GetLogVehicleDataResponseModel> getLogVehicleData(String id) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.getLogVehicle,
      method: MethodRequest.get,
      header: {"usd": id},
    );
    return GetLogVehicleDataResponseModel.fromJson(response.data);
  }

  Future<CreateVehicleResponseModel?> createVehicleData({
    required CreateVehicleRequestModel createVehicleRequestModel,
    required String token,
  }) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.createVehicle,
        method: MethodRequest.post,
        request: createVehicleRequestModel.toJson(),
        header: {
          "token": token,
        },
      );
      return CreateVehicleResponseModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<EditVehicleResponseModel?> editVehicleData({
    required EditVehicleRequestModel editVehicleRequestModel,
    required String token,
  }) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.editVehicle,
        method: MethodRequest.post,
        request: editVehicleRequestModel.toJson(),
        header: {
          "token": token,
        },
      );
      return EditVehicleResponseModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<CreateLogVehicleResponseModel> createLogVehicleData(CreateLogVehicleRequestModel createLogVehicleRequestModel) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.createLogVehicle,
      method: MethodRequest.post,
      request: createLogVehicleRequestModel.toJson(),
    );
    return CreateLogVehicleResponseModel.fromJson(response.data);
  }
}
