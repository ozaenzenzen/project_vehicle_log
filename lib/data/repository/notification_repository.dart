import 'package:project_vehicle_log/data/model/remote/notification/get_notification_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/notification/get_notification_response_model.dart';
import 'package:project_vehicle_log/data/model/remote/notification/get_notification_response_model_v2.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_api_path.dart';
import 'package:project_vehicle_log/support/app_api_service.dart';

class AppNotificationRepository {
  Future<GetNotificationResponseModel?> getNotification({
    required String userId,
    required String token,
  }) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.getNotification + userId,
        method: MethodRequest.get,
        header: <String, String>{
          'token': token,
        },
      );
      return GetNotificationResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      return null;
    }
  }

  Future<GetNotificationResponseModelV2?> getNotificationV2({
    required GetNotificationRequestModel reqData,
    required String token,
  }) async {
    try {
      Map<String, dynamic> req = reqData.toJson();
      if (reqData.sortOrder == null) {
        req.remove("sort_order");
      }
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.getNotificationV2,
        method: MethodRequest.post,
        request: req,
        header: <String, String>{
          'token': token,
        },
      );
      return GetNotificationResponseModelV2.fromJson(response.data);
    } catch (errorMessage) {
      return null;
    }
  }
}
