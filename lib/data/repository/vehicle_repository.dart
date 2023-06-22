import 'package:project_vehicle_log/data/model/vehicle/create_log_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/create_log_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/create_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/create_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/edit_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/edit_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/data/model/vehicle/get_log_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_api_path.dart';
import 'package:project_vehicle_log/support/app_api_service.dart';

class AppVehicleReposistory {
  Future<GetAllVehicleDataResponseModel> getAllVehicleData(String id) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.getAllVehicle,
      method: MethodRequest.get,
      header: {"usd": id},
    );
    return GetAllVehicleDataResponseModel.fromJson(response.data);
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

  Future<CreateVehicleResponseModel> createVehicleData(CreateVehicleRequestModel createVehicleRequestModel) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.createVehicle,
      method: MethodRequest.post,
      request: createVehicleRequestModel.toJson(),
    );
    return CreateVehicleResponseModel.fromJson(response.data);
  }

  Future<EditVehicleResponseModel> editVehicleData(EditVehicleRequestModel editVehicleRequestModel) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.editVehicle,
      method: MethodRequest.post,
      request: editVehicleRequestModel.toJson(),
    );
    return EditVehicleResponseModel.fromJson(response.data);
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
