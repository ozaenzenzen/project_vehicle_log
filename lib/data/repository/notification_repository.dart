import 'package:project_vehicle_log/data/model/remote/notification/get_notification_response_model.dart';
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
}
