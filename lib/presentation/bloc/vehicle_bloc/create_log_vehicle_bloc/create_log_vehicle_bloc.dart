import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_log_vehicle_event.dart';
part 'create_log_vehicle_state.dart';

class CreateLogVehicleBloc extends Bloc<CreateLogVehicleEvent, CreateLogVehicleState> {
  CreateLogVehicleBloc() : super(CreateLogVehicleInitial()) {
    on<CreateLogVehicleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
