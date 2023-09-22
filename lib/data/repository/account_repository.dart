import 'package:flutter/material.dart';
import 'package:project_vehicle_log/data/model/remote/account/get_userdata_response_models.dart';
import 'package:project_vehicle_log/data/model/remote/account/signin_request_models.dart';
import 'package:project_vehicle_log/data/model/remote/account/signin_response_models.dart';
import 'package:project_vehicle_log/data/model/remote/account/signup_request_models.dart';
import 'package:project_vehicle_log/data/model/remote/account/signup_response_models.dart';
import 'package:project_vehicle_log/data/model/remote/edit_profile/request/edit_profile_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/edit_profile/response/edit_profile_response_model.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_api_path.dart';
import 'package:project_vehicle_log/support/app_api_service.dart';

class AppAccountReposistory {
  Future<SignInResponseModel?> signin(SignInRequestModel data) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.signInAccount,
        request: data.toJson(),
      );
      return SignInResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[AppAccountReposistory][signin] errorMessage $errorMessage");
      return null;
    }
  }

  Future<SignUpResponseModel?> signup(SignUpRequestModel data) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.signUpAccount,
        request: data.toJson(),
      );
      return SignUpResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[AppAccountReposistory][signup] errorMessage $errorMessage");
      return null;
    }
  }

  Future<GetUserDataResponseModel?> getUserdata(String token) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.signUpAccount,
        method: MethodRequest.get,
        header: <String, String>{
          'token': token,
        },
      );
      return GetUserDataResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[AppAccountReposistory][getUserdata] errorMessage $errorMessage");
      return null;
    }
  }

  Future<EditProfileResponseModel?> editProfile({
    required EditProfileRequestModel data,
    required String token,
  }) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.editProfile,
        method: MethodRequest.post,
        request: data.toJson(),
        header: <String, String>{
          'token': token,
        },
      );
      return EditProfileResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[AppAccountReposistory][editProfile] errorMessage $errorMessage");
      return null;
    }
  }
}
