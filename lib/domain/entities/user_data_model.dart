class UserDataModel {
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? token;

  UserDataModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "token": token,
      };
}
