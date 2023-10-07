// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/local/account_user_data_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/edit_measurement_log_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/edit_measurement_log_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';

part 'edit_measurement_log_event.dart';
part 'edit_measurement_log_state.dart';

class EditMeasurementLogBloc extends Bloc<EditMeasurementLogEvent, EditMeasurementLogState> {
  EditMeasurementLogBloc() : super(EditMeasurementLogInitial()) {
    on<EditMeasurementLogEvent>((event, emit) {
      if (event is UpdateMeasurementAction) {
        _updateMeasurementAction(event);
      }
      if (event is DeleteMeasurementAction) {
        _deleteMeasurementAction(event);
      }
    });
  }

  Future<void> _updateMeasurementAction(
    UpdateMeasurementAction event,
  ) async {
    emit(EditMeasurementLogLoading());
    try {
      AccountDataUserModel? dataLocal = await AccountLocalRepository().getLocalAccountData();
      if (dataLocal != null) {
        EditMeasurementLogResponseModel? editMeasurementLogResponseModel = await AppVehicleReposistory().editMeasurementLogVehicleData(
          editMeasurementLogRequestModel: event.editMeasurementLogRequestModel,
          token: dataLocal.token!,
        );
        if (editMeasurementLogResponseModel != null) {
          if (editMeasurementLogResponseModel.status == 202) {
            emit(
              EditMeasurementLogSuccess(
                editMeasurementLogResponseModel: editMeasurementLogResponseModel,
              ),
            );
          } else {
            emit(
              EditMeasurementLogFailed(
                errorMessage: editMeasurementLogResponseModel.message.toString(),
              ),
            );
          }
        } else {
          emit(
            EditMeasurementLogFailed(
              errorMessage: 'Data Empty',
            ),
          );
        }
      } else {
        emit(
          EditMeasurementLogFailed(
            errorMessage: 'Terjadi kesalahan',
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        EditMeasurementLogFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }

  Future<void> _deleteMeasurementAction(
    DeleteMeasurementAction event,
  ) async {
    //
  }
}
