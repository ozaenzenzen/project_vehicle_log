// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';

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
    try {
      UserDataEntity? dataLocal = await AccountLocalRepository().getLocalAccountDataV2();
      if (dataLocal != null) {
        CreateVehicleResponseModel? createVehicleResponseModel = await appVehicleReposistory.createVehicleData(
          createVehicleRequestModel: event.createVehicleRequestModel,
          token: dataLocal.token!,
        );
        if (createVehicleResponseModel != null) {
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
        } else {
          emit(
            CreateVehicleFailed(
              errorMessage: 'Data Empty',
            ),
          );
        }
      } else {
        emit(
          CreateVehicleFailed(
            errorMessage: 'Terjadi kesalahan',
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
