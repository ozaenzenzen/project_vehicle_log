// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/edit_vehicle_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/edit_vehicle_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';

part 'edit_vehicle_event.dart';
part 'edit_vehicle_state.dart';

class EditVehicleBloc extends Bloc<EditVehicleEvent, EditVehicleState> {
  EditVehicleBloc() : super(EditVehicleInitial()) {
    on<EditVehicleEvent>((event, emit) {
      if (event is EditVehicleAction) {
        _editVehicleAction(event);
      }
    });
  }

  Future<void> _editVehicleAction(
    EditVehicleAction event,
  ) async {
    emit(EditVehicleLoading());
    try {
      UserDataEntity? dataLocal = await AccountLocalRepository().getLocalAccountDataV2();
      if (dataLocal != null) {
        EditVehicleResponseModel? editVehicleResponseModel = await event.appVehicleReposistory.editVehicleData(
          editVehicleRequestModel: event.editVehicleRequestModel,
          token: dataLocal.token!,
        );
        if (editVehicleResponseModel != null) {
          if (editVehicleResponseModel.status == 201) {
            emit(
              EditVehicleSuccess(
                editVehicleResponseModel: editVehicleResponseModel,
              ),
            );
          } else {
            emit(
              EditVehicleFailed(
                errorMessage: editVehicleResponseModel.message.toString(),
              ),
            );
          }
        } else {
          emit(
            EditVehicleFailed(
              errorMessage: 'Data Empty',
            ),
          );
        }
      } else {
        emit(
          EditVehicleFailed(
            errorMessage: 'Terjadi kesalahan',
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        EditVehicleFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
