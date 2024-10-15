part of 'get_all_vehicle_v2_bloc.dart';

@immutable
abstract class GetAllVehicleV2Event {}

class GetAllVehicleV2Action extends GetAllVehicleV2Event {
  final GetAllVehicleRequestModelV2 reqData;
  GetAllVehicleV2Action({required this.reqData});
}
