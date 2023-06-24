// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/local_repository/vehicle_local_repository.dart';
import 'package:project_vehicle_log/data/model/local/account_user_data_model.dart';
import 'package:project_vehicle_log/data/model/local/vehicle_local_data_model.dart';
import 'package:project_vehicle_log/data/model/remote/vehicle/get_all_vehicle_data_response_model.dart';
import 'package:project_vehicle_log/data/repository/vehicle_repository.dart';

part 'get_all_vehicle_event.dart';
part 'get_all_vehicle_state.dart';

class GetAllVehicleBloc extends Bloc<GetAllVehicleEvent, GetAllVehicleState> {
  GetAllVehicleBloc(AppVehicleReposistory appVehicleReposistory) : super(GetAllVehicleInitial()) {
    on<GetAllVehicleEvent>((event, emit) {
      if (event is GetAllVehicleDataAction) {
        _getAllVehicleAction(appVehicleReposistory, event);
      } else if (event is GetAllVehicleDataFromLocalAction) {
        _getAllVehicleFromLocalAction(event.vehicleLocalRepository);
      } else if (event is GetProfileDataVehicleAction) {
        _getProfileDataAction(event.localRepository);
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
        VehicleLocalDataModel data = VehicleLocalDataModel(
          listVehicleData: getAllVehicleDataResponseModel.data!
              .map((e) => VehicleDatam(
                    id: e.id,
                    userId: e.userId,
                    vehicleName: e.vehicleName,
                    vehicleImage: e.vehicleImage,
                    year: e.year,
                    engineCapacity: e.engineCapacity,
                    tankCapacity: e.tankCapacity,
                    color: e.color,
                    machineNumber: e.machineNumber,
                    chassisNumber: e.chassisNumber,
                    vehicleMeasurementLogModels: e.vehicleMeasurementLogModels
                        .map((e) => LocalVehicleMeasurementLogModel(
                              id: e.id,
                              userId: e.userId,
                              vehicleId: e.vehicleId,
                              measurementTitle: e.measurementTitle,
                              currentOdo: e.currentOdo,
                              estimateOdoChanging: e.estimateOdoChanging,
                              amountExpenses: e.amountExpenses,
                              checkpointDate: e.checkpointDate,
                              notes: e.notes,
                            ))
                        .toList(),
                  ))
              .toList(),
        );
        await VehicleLocalRepository.saveLocalVehicleData(data: data);
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

  Future<void> _getAllVehicleFromLocalAction(
    VehicleLocalRepository vehicleLocalRepository,
  ) async {
    emit(GetAllVehicleLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      VehicleLocalDataModel vehicleLocalDataModel = await vehicleLocalRepository.getLocalVehicleData();
      if (vehicleLocalDataModel != null) {
        emit(
          GetAllVehicleSuccess(
            getAllVehicleDataResponseModel: GetAllVehicleDataResponseModel(
              status: 200,
              message: "Success",
              data: vehicleLocalDataModel.listVehicleData!
                  .map(
                    (e) => DatumVehicle(
                      id: e.id!,
                      userId: e.userId!,
                      vehicleName: e.vehicleName!,
                      vehicleImage: e.vehicleImage!,
                      year: e.year!,
                      engineCapacity: e.engineCapacity!,
                      tankCapacity: e.tankCapacity!,
                      color: e.color!,
                      machineNumber: e.machineNumber!,
                      chassisNumber: e.chassisNumber!,
                      vehicleMeasurementLogModels: e.vehicleMeasurementLogModels!
                          .map(
                            (e) => VehicleMeasurementLogModel(
                              id: e.id!,
                              userId: e.userId!,
                              vehicleId: e.vehicleId!,
                              measurementTitle: e.measurementTitle!,
                              currentOdo: e.currentOdo!,
                              estimateOdoChanging: e.estimateOdoChanging!,
                              amountExpenses: e.amountExpenses!,
                              checkpointDate: e.checkpointDate!,
                              notes: e.notes!,
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      } else {
        emit(
          GetAllVehicleFailed(
            errorMessage: "Failed to Get Vehicle Data",
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

  Future<void> _getProfileDataAction(
    AccountLocalRepository localRepository,
  ) async {
    emit(GetAllVehicleLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      AccountDataUserModel accountDataUserModel = await localRepository.getLocalAccountData();
      if (accountDataUserModel != null) {
        emit(GetProfileDataVehicleSuccess(
          accountDataUserModel: accountDataUserModel,
        ));
      } else {
        emit(
          GetAllVehicleFailed(errorMessage: "Failed To Get Profile Data"),
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
