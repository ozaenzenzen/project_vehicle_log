// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_log_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_log_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';

part 'create_log_vehicle_event.dart';
part 'create_log_vehicle_state.dart';

class CreateLogVehicleBloc extends Bloc<CreateLogVehicleEvent, CreateLogVehicleState> {
  CreateLogVehicleBloc(AppVehicleReposistory appVehicleReposistory) : super(CreateLogVehicleInitial()) {
    on<CreateLogVehicleEvent>((event, emit) {
      if (event is CreateLogVehicleAction) {
        _getAllVehicleAction(appVehicleReposistory, event);
      }
    });
  }

  Future<void> _getAllVehicleAction(
    AppVehicleReposistory appVehicleReposistory,
    CreateLogVehicleAction event,
  ) async {
    emit(CreateLogVehicleLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      CreateLogVehicleResponseModel createLogVehicleResponseModel = await appVehicleReposistory.createLogVehicleData(
        event.createLogVehicleRequestModel,
      );
      if (createLogVehicleResponseModel.status == 201) {
        emit(
          CreateLogVehicleSuccess(
            createLogVehicleResponseModel: createLogVehicleResponseModel,
          ),
        );
      } else {
        emit(
          CreateLogVehicleFailed(
            errorMessage: "Terjadi kesalahan",
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        CreateLogVehicleFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
