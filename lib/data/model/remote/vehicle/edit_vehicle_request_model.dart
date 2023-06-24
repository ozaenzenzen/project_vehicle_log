class EditVehicleRequestModel {
  String vehicleName;
  String vehicleImage;
  String year;
  String engineCapacity;
  String tankCapacity;
  String color;
  String machineNumber;
  String chassisNumber;

  EditVehicleRequestModel({
    required this.vehicleName,
    required this.vehicleImage,
    required this.year,
    required this.engineCapacity,
    required this.tankCapacity,
    required this.color,
    required this.machineNumber,
    required this.chassisNumber,
  });

  factory EditVehicleRequestModel.fromJson(Map<String, dynamic> json) => EditVehicleRequestModel(
        vehicleName: json["vehicle_name"],
        vehicleImage: json["vehicle_image"],
        year: json["year"],
        engineCapacity: json["engine_capacity"],
        tankCapacity: json["tank_capacity"],
        color: json["color"],
        machineNumber: json["machine_number"],
        chassisNumber: json["chassis_number"],
      );

  Map<String, dynamic> toJson() => {
        "vehicle_name": vehicleName,
        "vehicle_image": vehicleImage,
        "year": year,
        "engine_capacity": engineCapacity,
        "tank_capacity": tankCapacity,
        "color": color,
        "machine_number": machineNumber,
        "chassis_number": chassisNumber,
      };
}
