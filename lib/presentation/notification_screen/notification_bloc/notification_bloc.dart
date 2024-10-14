// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/notification/get_notification_response_model.dart';
import 'package:project_vehicle_log/data/repository/notification_repository.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';

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
    GetNotificationAction editProfileAction,
  ) async {
    emit(NotificationLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    UserDataEntity? data = await AccountLocalRepository().getLocalAccountDataV2();
    try {
      GetNotificationResponseModel? getNotificationResponseModel = await notificationRepository.getNotification(
        userId: data!.id!.toString(),
        token: data.token!,
      );
      if (getNotificationResponseModel != null) {
        if (getNotificationResponseModel.status == 200) {
          getNotificationResponseModel.notification!.sort((a, b) {
            return b.updatedAt!.compareTo(a.updatedAt!);
          });
          emit(NotificationSuccess(
            getNotificationResponseModel: getNotificationResponseModel,
          ));
        } else {
          emit(
            NotificationFailed(
              errorMessage: getNotificationResponseModel.message!,
            ),
          );
        }
      } else {
        emit(
          NotificationFailed(errorMessage: "Failed edit profile"),
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
