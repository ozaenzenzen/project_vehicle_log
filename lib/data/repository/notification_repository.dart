import 'package:project_vehicle_log/data/model/remote/notification/get_notification_response_model.dart';
import 'package:project_vehicle_log/env.dart';
import 'package:project_vehicle_log/support/app_api_path.dart';
import 'package:project_vehicle_log/support/app_api_service.dart';

class AppNotificationRepository {
  Future<GetNotificationResponseModel> getNotification(String userId) async {
    final response = await AppApiService(
      EnvironmentConfig.baseUrl(),
    ).call(
      AppApiPath.getNotification + userId,
      method: MethodRequest.get,
    );
    return GetNotificationResponseModel.fromJson(response.data);
  }
}
