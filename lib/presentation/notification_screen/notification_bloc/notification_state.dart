part of 'notification_bloc.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final GetNotificationResponseModelV2 result;
  NotificationSuccess({
    required this.result,
  });
}

class NotificationFailed extends NotificationState {
  final String errorMessage;
  NotificationFailed({required this.errorMessage});
}
