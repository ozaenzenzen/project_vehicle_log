class GetNotificationResponseModel {
  int status;
  String message;
  List<Notification>? notification;

  GetNotificationResponseModel({
    required this.status,
    required this.message,
    required this.notification,
  });

  factory GetNotificationResponseModel.fromJson(Map<String, dynamic> json) => GetNotificationResponseModel(
        status: json["status"],
        message: json["message"],
        notification: List<Notification>.from(json["notification"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "notification": List<dynamic>.from(notification!.map((x) => x.toJson())),
      };
}

class Notification {
  int notificationId;
  int userId;
  String notificationTitle;
  String notificationDescription;
  int notificationStatus;
  int notificationType;
  DateTime createdAt;
  DateTime updatedAt;

  Notification({
    required this.notificationId,
    required this.userId,
    required this.notificationTitle,
    required this.notificationDescription,
    required this.notificationStatus,
    required this.notificationType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        notificationId: json["notification_id"],
        userId: json["user_id"],
        notificationTitle: json["notification_title"],
        notificationDescription: json["notification_description"],
        notificationStatus: json["notification_status"],
        notificationType: json["notification_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "notification_id": notificationId,
        "user_id": userId,
        "notification_title": notificationTitle,
        "notification_description": notificationDescription,
        "notification_status": notificationStatus,
        "notification_type": notificationType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
