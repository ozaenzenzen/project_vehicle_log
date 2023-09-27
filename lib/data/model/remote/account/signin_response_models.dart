class SignInResponseModel {
  SignInResponseModel({
    this.status,
    this.message,
    this.userdata,
  });

  dynamic status;
  String? message;
  Userdata? userdata;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) => SignInResponseModel(
        status: json["status"],
        message: json["message"],
        userdata: json["userdata"] == null ? null : Userdata.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "userdata": userdata?.toJson(),
      };
}

class Userdata {
  Userdata({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.link,
    this.token,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? link;
  String? token;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        link: json["link"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "link": link,
        "token": token,
      };
}
