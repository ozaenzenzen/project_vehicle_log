import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';

class SignUpResponseModel {
  int? status;
  String? message;
  SignUpData? data;

  SignUpResponseModel({
    this.status,
    this.message,
    this.data,
  });

  UserDataEntity? toUserDataEntity() {
    if (data != null) {
      return UserDataEntity.fromJson(data!.toJson());
    } else {
      return null;
    }
  }

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["Data"] == null ? null : SignUpData.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "Data": data?.toJson(),
      };
}

class SignUpData {
  int? userId;
  String? userStamp;
  String? name;
  String? email;
  String? phone;

  SignUpData({
    this.userId,
    this.userStamp,
    this.name,
    this.email,
    this.phone,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
        userId: json["id"],
        userStamp: json["user_stamp"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": userId,
        "user_stamp": userStamp,
        "name": name,
        "email": email,
        "phone": phone,
      };
}
