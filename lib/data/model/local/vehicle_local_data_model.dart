class VehicleLocalDataModel {
  List<VehicleDatam>? listVehicleData;

  VehicleLocalDataModel({
    this.listVehicleData,
  });

  factory VehicleLocalDataModel.fromJson(Map<String, dynamic> json) => VehicleLocalDataModel(
        listVehicleData: List<VehicleDatam>.from(
          json["listVehicleData"].map(
            (x) => VehicleDatam.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "listVehicleData": List<dynamic>.from(
          listVehicleData!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class VehicleDatam {
  int? id;
  int? userId;
  String? vehicleName;
  String? vehicleImage;
  String? year;
  String? engineCapacity;
  String? tankCapacity;
  String? color;
  String? machineNumber;
  String? chassisNumber;
  List<LocalVehicleMeasurementLogModel>? vehicleMeasurementLogModels;

  VehicleDatam({
    this.id,
    this.userId,
    this.vehicleName,
    this.vehicleImage,
    this.year,
    this.engineCapacity,
    this.tankCapacity,
    this.color,
    this.machineNumber,
    this.chassisNumber,
    this.vehicleMeasurementLogModels,
  });

  factory VehicleDatam.fromJson(Map<String, dynamic> json) => VehicleDatam(
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
        vehicleMeasurementLogModels: List<LocalVehicleMeasurementLogModel>.from(
          json["vehicle_measurement_log_models"].map(
            (x) => LocalVehicleMeasurementLogModel.fromJson(x),
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
        "vehicle_measurement_log_models": List<dynamic>.from(
          vehicleMeasurementLogModels!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class LocalVehicleMeasurementLogModel {
  int? id;
  int? userId;
  int? vehicleId;
  String? measurementTitle;
  String? currentOdo;
  String? estimateOdoChanging;
  String? amountExpenses;
  String? checkpointDate;
  String? notes;

  LocalVehicleMeasurementLogModel({
    this.id,
    this.userId,
    this.vehicleId,
    this.measurementTitle,
    this.currentOdo,
    this.estimateOdoChanging,
    this.amountExpenses,
    this.checkpointDate,
    this.notes,
  });

  factory LocalVehicleMeasurementLogModel.fromJson(Map<String, dynamic> json) => LocalVehicleMeasurementLogModel(
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