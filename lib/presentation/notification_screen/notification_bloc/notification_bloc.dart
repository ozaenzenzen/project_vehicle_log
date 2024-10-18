// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/notification/get_notification_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/notification/get_notification_response_model_v2.dart';
import 'package:project_vehicle_log/data/repository/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {
      if (event is GetNotificationAction) {
        _getNotificationAction(event.appNotificationRepository, event);
      }
    });
  }

  Future<void> _getNotificationAction(
    AppNotificationRepository notificationRepository,
    GetNotificationAction event,
  ) async {
    emit(NotificationLoading());
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      String? userToken = await AccountLocalRepository().getUserToken();
      if (userToken == null) {
        emit(
          NotificationFailed(errorMessage: "Failed To Get Support Data"),
        );
        return;
      }

      GetNotificationResponseModelV2? responseData = await notificationRepository.getNotificationV2(
        reqData: event.requestData,
        token: userToken,
      );
      if (responseData == null) {
        emit(
          NotificationFailed(
            errorMessage: "Failed edit profile",
          ),
        );
        return;
      }

      if (responseData.status != 200) {
        emit(
          NotificationFailed(
            errorMessage: responseData.message!,
          ),
        );
        return;
      }

      if (responseData.data != null) {
        emit(
          NotificationSuccess(
            result: responseData,
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        NotificationFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
