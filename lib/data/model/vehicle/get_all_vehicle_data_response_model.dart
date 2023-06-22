class GetAllVehicleDataResponseModel {
  int status;
  String message;
  List<Datum>? data;

  GetAllVehicleDataResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllVehicleDataResponseModel.fromJson(Map<String, dynamic> json) => GetAllVehicleDataResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int userId;
  String vehicleName;
  String vehicleImage;
  String year;
  String engineCapacity;
  String tankCapacity;
  String color;
  String machineNumber;
  String chassisNumber;
  List<VehicleMeasurementLogModel> vehicleMeasurementLogModels;

  Datum({
    required this.userId,
    required this.vehicleName,
    required this.vehicleImage,
    required this.year,
    required this.engineCapacity,
    required this.tankCapacity,
    required this.color,
    required this.machineNumber,
    required this.chassisNumber,
    required this.vehicleMeasurementLogModels,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        vehicleName: json["vehicle_name"],
        vehicleImage: json["vehicle_image"],
        year: json["year"],
        engineCapacity: json["engine_capacity"],
        tankCapacity: json["tank_capacity"],
        color: json["color"],
        machineNumber: json["machine_number"],
        chassisNumber: json["chassis_number"],
        vehicleMeasurementLogModels: List<VehicleMeasurementLogModel>.from(json["vehicle_measurement_log_models"].map((x) => VehicleMeasurementLogModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "vehicle_name": vehicleName,
        "vehicle_image": vehicleImage,
        "year": year,
        "engine_capacity": engineCapacity,
        "tank_capacity": tankCapacity,
        "color": color,
        "machine_number": machineNumber,
        "chassis_number": chassisNumber,
        "vehicle_measurement_log_models": List<dynamic>.from(vehicleMeasurementLogModels.map((x) => x.toJson())),
      };
}

class VehicleMeasurementLogModel {
  int id;
  int userId;
  int vehicleId;
  String measurementTitle;
  String currentOdo;
  String estimateOdoChanging;
  String amountExpenses;
  String checkpointDate;
  String notes;
  DateTime createdAt;
  DateTime updatedAt;

  VehicleMeasurementLogModel({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.measurementTitle,
    required this.currentOdo,
    required this.estimateOdoChanging,
    required this.amountExpenses,
    required this.checkpointDate,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VehicleMeasurementLogModel.fromJson(Map<String, dynamic> json) => VehicleMeasurementLogModel(
        id: json["id"],
        userId: json["user_id"],
        vehicleId: json["vehicle_id"],
        measurementTitle: json["measurement_title"],
        currentOdo: json["current_odo"],
        estimateOdoChanging: json["estimate_odo_changing"],
        amountExpenses: json["amount_expenses"],
        checkpointDate: json["checkpoint_date"],
        notes: json["notes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "vehicle_id": vehicleId,
        "measurement_title": measurementTitle,
        "current_odo": currentOdo,
        "estimate_odo_changing": estimateOdoChanging,
        "amount_expenses": amountExpenses,
        "checkpoint_date": checkpointDate,
        "notes": notes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}