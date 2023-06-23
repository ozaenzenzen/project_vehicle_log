part of 'get_all_vehicle_bloc.dart';

@immutable
abstract class GetAllVehicleEvent {}

class GetAllVehicleDataAction extends GetAllVehicleEvent {
  final String id;

  GetAllVehicleDataAction({
    required this.id,
  });
}

class GetProfileDataVehicleAction extends GetAllVehicleEvent {
  final LocalRepository localRepository;

  GetProfileDataVehicleAction({
    required this.localRepository,
  });
}
