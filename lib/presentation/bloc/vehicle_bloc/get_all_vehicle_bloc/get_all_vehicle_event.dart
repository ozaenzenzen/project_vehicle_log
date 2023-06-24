part of 'get_all_vehicle_bloc.dart';

@immutable
abstract class GetAllVehicleEvent {}

class GetAllVehicleDataAction extends GetAllVehicleEvent {
  final String id;

  GetAllVehicleDataAction({
    required this.id,
  });
}

class GetAllVehicleDataFromLocalAction extends GetAllVehicleEvent {
  final VehicleLocalRepository vehicleLocalRepository;

  GetAllVehicleDataFromLocalAction({
    required this.vehicleLocalRepository,
  });
}

class GetProfileDataVehicleAction extends GetAllVehicleEvent {
  final AccountLocalRepository localRepository;

  GetProfileDataVehicleAction({
    required this.localRepository,
  });
}
