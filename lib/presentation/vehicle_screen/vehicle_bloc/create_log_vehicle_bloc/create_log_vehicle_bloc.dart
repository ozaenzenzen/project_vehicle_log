// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/local/account_user_data_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_log_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/create_log_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';

part 'create_log_vehicle_event.dart';
part 'create_log_vehicle_state.dart';

class CreateLogVehicleBloc extends Bloc<CreateLogVehicleEvent, CreateLogVehicleState> {
  CreateLogVehicleBloc(AppVehicleReposistory appVehicleReposistory) : super(CreateLogVehicleInitial()) {
    on<CreateLogVehicleEvent>((event, emit) {
      if (event is CreateLogVehicleAction) {
        _createLogVehicleAction(appVehicleReposistory, event);
      }
    });
  }

  Future<void> _createLogVehicleAction(
    AppVehicleReposistory appVehicleReposistory,
    CreateLogVehicleAction event,
  ) async {
    emit(CreateLogVehicleLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      AccountDataUserModel? dataLocal = await AccountLocalRepository().getLocalAccountData();
      if (dataLocal != null) {
        CreateLogVehicleResponseModel? createLogVehicleResponseModel = await appVehicleReposistory.createLogVehicleData(
          createLogVehicleRequestModel: event.createLogVehicleRequestModel,
          token: dataLocal.token!,
        );
        if (createLogVehicleResponseModel != null) {
          if (createLogVehicleResponseModel.status == 201) {
            emit(
              CreateLogVehicleSuccess(
                createLogVehicleResponseModel: createLogVehicleResponseModel,
              ),
            );
          } else {
            emit(
              CreateLogVehicleFailed(
                errorMessage: "${createLogVehicleResponseModel.message}",
              ),
            );
          }
        } else {
          emit(
            CreateLogVehicleFailed(
              errorMessage: "Response data is null",
            ),
          );
        }
      } else {
        emit(
          CreateLogVehicleFailed(
            errorMessage: "Failed to get local data",
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
