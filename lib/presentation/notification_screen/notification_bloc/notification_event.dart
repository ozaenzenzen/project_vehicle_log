part of 'notification_bloc.dart';

abstract class NotificationEvent {}

class GetNotificationAction extends NotificationEvent {
  final AppNotificationRepository appNotificationRepository;
  final GetNotificationRequestModel requestData;

  GetNotificationAction({
    required this.appNotificationRepository,
    required this.requestData,
  });
}
