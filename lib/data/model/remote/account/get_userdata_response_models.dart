class GetUserDataResponseModel {
  GetUserDataResponseModel({
    this.status,
    this.message,
    this.userdata,
  });

  dynamic status;
  String? message;
  UserdataGet? userdata;

  factory GetUserDataResponseModel.fromJson(Map<String, dynamic> json) => GetUserDataResponseModel(
        status: json["status"],
        message: json["message"],
        userdata: json["userdata"] == null ? null : UserdataGet.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "userdata": userdata?.toJson(),
      };
}

class UserdataGet {
  UserdataGet({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.link,
    this.typeuser,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? link;
  int? typeuser;

  factory UserdataGet.fromJson(Map<String, dynamic> json) => UserdataGet(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        link: json["link"],
        typeuser: json["typeuser"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "link": link,
        "typeuser": typeuser,
      };
}
