// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/model/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';

part 'get_all_vehicle_event.dart';
part 'get_all_vehicle_state.dart';

class GetAllVehicleBloc extends Bloc<GetAllVehicleEvent, GetAllVehicleState> {
  GetAllVehicleBloc(AppVehicleReposistory appVehicleReposistory) : super(GetAllVehicleInitial()) {
    on<GetAllVehicleEvent>((event, emit) {
      if (event is GetAllVehicleDataAction) {
        _getAllVehicleAction(appVehicleReposistory, event);
      }
    });
  }

  Future<void> _getAllVehicleAction(
    AppVehicleReposistory appVehicleReposistory,
    GetAllVehicleDataAction event,
  ) async {
    emit(GetAllVehicleLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      GetAllVehicleDataResponseModel getAllVehicleDataResponseModel = await appVehicleReposistory.getAllVehicleData(
        event.id,
      );
      if (getAllVehicleDataResponseModel.status == 200) {
        emit(
          GetAllVehicleSuccess(
            getAllVehicleDataResponseModel: getAllVehicleDataResponseModel,
          ),
        );
      } else {
        emit(
          GetAllVehicleFailed(
            errorMessage: getAllVehicleDataResponseModel.message.toString(),
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        GetAllVehicleFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
