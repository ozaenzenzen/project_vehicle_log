// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';

part 'create_vehicle_event.dart';
part 'create_vehicle_state.dart';

class CreateVehicleBloc extends Bloc<CreateVehicleEvent, CreateVehicleState> {
  CreateVehicleBloc(AppVehicleReposistory appVehicleReposistory) : super(CreateVehicleInitial()) {
    on<CreateVehicleEvent>((event, emit) {
      if (event is CreateVehicleAction) {
        _createVehicleAction(appVehicleReposistory, event);
      }
    });
  }

  Future<void> _createVehicleAction(
    AppVehicleReposistory appVehicleReposistory,
    CreateVehicleAction event,
  ) async {
    emit(CreateVehicleLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      CreateVehicleResponseModel createVehicleResponseModel = await appVehicleReposistory.createVehicleData(
        event.createVehicleRequestModel,
      );
      if (createVehicleResponseModel.status == 201) {
        emit(
          CreateVehicleSuccess(
            createVehicleResponseModel: createVehicleResponseModel,
          ),
        );
      } else {
        emit(
          CreateVehicleFailed(
            errorMessage: createVehicleResponseModel.message.toString(),
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        CreateVehicleFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
