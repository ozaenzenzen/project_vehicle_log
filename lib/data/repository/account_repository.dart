import 'package:project_vehicle_log/data/model/account/get_userdata_response_models.dart';
import 'package:project_vehicle_log/data/model/account/signin_request_models.dart';
import 'package:project_vehicle_log/data/model/account/signin_response_models.dart';
import 'package:project_vehicle_log/data/model/account/signup_request_models.dart';
import 'package:project_vehicle_log/data/model/account/signup_response_models.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_api_path.dart';
import 'package:project_vehicle_log/support/app_api_service.dart';

class AppAccountReposistory {
  static Future<SignInResponseModel> signin(SignInRequestModel data) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.signInAccount,
      request: data.toJson(),
    );
    return SignInResponseModel.fromJson(response.data);
  }

  static Future<SignUpResponseModel> signup(SignUpRequestModel data) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.signUpAccount,
      request: data.toJson(),
    );
    return SignUpResponseModel.fromJson(response.data);
  }

  static Future<GetUserDataResponseModel> getUserdata(String userId) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.signUpAccount + userId,
      method: MethodRequest.get,
    );
    return GetUserDataResponseModel.fromJson(response.data);
  }
}
