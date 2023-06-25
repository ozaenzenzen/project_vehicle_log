class GetAllVehicleDataResponseModel {
  int status;
  String message;
  List<DatumVehicle>? data;

  GetAllVehicleDataResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllVehicleDataResponseModel.fromJson(Map<String, dynamic> json) => GetAllVehicleDataResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<DatumVehicle>.from(json["Data"].map((x) => DatumVehicle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumVehicle {
  int id;
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
  List<CategorizedVehicleLogData>? categorizedData;

  DatumVehicle({
    required this.id,
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
    this.categorizedData,
  });

  factory DatumVehicle.fromJson(Map<String, dynamic> json) => DatumVehicle(
        id: json["id"],
        userId: json["user_id"],
        vehicleName: json["vehicle_name"],
        vehicleImage: json["vehicle_image"],
        year: json["year"],
        engineCapacity: json["engine_capacity"],
        tankCapacity: json["tank_capacity"],
        color: json["color"],
        machineNumber: json["machine_number"],
        chassisNumber: json["chassis_number"],
        vehicleMeasurementLogModels: List<VehicleMeasurementLogModel>.from(
          json["vehicle_measurement_log_models"].map(
            (x) => VehicleMeasurementLogModel.fromJson(x),
          ),
        ),
        // categorizedData: json["categorized_data"],
        categorizedData: (json["categorized_data"] == null) ? null : List<CategorizedVehicleLogData>.from(
          json["categorized_data"].map(
            (x) => CategorizedVehicleLogData.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "categorized_data": categorizedData,
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
      };
}

class CategorizedVehicleLogData {
  String? measurementTitle;
  List<VehicleMeasurementLogModel>? vehicleMeasurementLogModels;

  CategorizedVehicleLogData({
    this.measurementTitle,
    this.vehicleMeasurementLogModels,
  });

  factory CategorizedVehicleLogData.fromJson(Map<String, dynamic> json) => CategorizedVehicleLogData(
        measurementTitle: json['measurement_title'],
        vehicleMeasurementLogModels: List<VehicleMeasurementLogModel>.from(
          json["vehicle_measurement_log_models"].map(
            (x) => VehicleMeasurementLogModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "measurement_title": measurementTitle,
        "vehicle_measurement_log_models": List<dynamic>.from(
          vehicleMeasurementLogModels!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
