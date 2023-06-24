class CreateLogVehicleResponseModel {
  int status;
  String message;

  CreateLogVehicleResponseModel({
    required this.status,
    required this.message,
  });

  factory CreateLogVehicleResponseModel.fromJson(Map<String, dynamic> json) => CreateLogVehicleResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
