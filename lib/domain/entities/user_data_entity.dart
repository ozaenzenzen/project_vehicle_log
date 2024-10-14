class UserDataEntity {
  int? id;
  String? userStamp;
  String? name;
  String? email;
  String? phone;
  String? profilePicture;
  String? token;
  String? refreshToken;

  UserDataEntity({
    this.id,
    this.userStamp,
    this.name,
    this.email,
    this.phone,
    this.profilePicture,
    this.token,
    this.refreshToken,
  });

  factory UserDataEntity.fromJson(Map<String, dynamic> json) => UserDataEntity(
        id: json["id"],
        userStamp: json["user_stamp"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profilePicture: json["profile_picture"],
        token: json["token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_stamp": userStamp,
        "name": name,
        "email": email,
        "phone": phone,
        "profile_picture": profilePicture,
        "token": token,
        "refresh_token": refreshToken,
      };
}
