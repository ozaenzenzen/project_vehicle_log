class SignUpResponseModel {
  SignUpResponseModel({
    this.status,
    this.message,
    this.accountData,
  });

  dynamic status;
  String? message;
  AccountData? accountData;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        status: json["status"],
        message: json["message"],
        accountData: json["account_data"] != null ? AccountData.fromJson(json["account_data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "account_data": accountData?.toJson(),
      };
}

class AccountData {
  AccountData({
    required this.userId,
    this.name,
    this.email,
    this.phone,
  });

  int? userId;
  String? name;
  String? email;
  String? phone;

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        userId: json["user_id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phone": phone,
      };
}
