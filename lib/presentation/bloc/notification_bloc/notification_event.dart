part of 'notification_bloc.dart';

abstract class NotificationEvent {}

class GetNotificationAction extends NotificationEvent {
  final AppNotificationRepository appNotificationRepository;
  GetNotificationAction({required this.appNotificationRepository});
}
