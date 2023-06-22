import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_vehicle_event.dart';
part 'create_vehicle_state.dart';

class CreateVehicleBloc extends Bloc<CreateVehicleEvent, CreateVehicleState> {
  CreateVehicleBloc() : super(CreateVehicleInitial()) {
    on<CreateVehicleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
