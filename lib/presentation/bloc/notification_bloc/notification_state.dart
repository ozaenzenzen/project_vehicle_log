part of 'notification_bloc.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final GetNotificationResponseModel getNotificationResponseModel;
  NotificationSuccess({required this.getNotificationResponseModel});
}

class NotificationFailed extends NotificationState {
  final String errorMessage;
  NotificationFailed({required this.errorMessage});
}
