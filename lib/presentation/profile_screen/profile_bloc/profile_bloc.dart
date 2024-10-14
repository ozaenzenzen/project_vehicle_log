// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/account/get_userdata_response_models.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(AccountLocalRepository localRepository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      if (event is GetProfileLocalAction) {
        _getProfileDataAction(localRepository);
      }
      if (event is GetProfileRemoteAction) {
        _getProfileRemoteAction(event.accountRepository);
      }
    });
  }
  Future<void> _getProfileRemoteAction(
    AppAccountReposistory accountRepository,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      UserDataEntity? dataLocal = await AccountLocalRepository().getLocalAccountDataV2();
      if (dataLocal != null) {
        GetUserDataResponseModel? getUserDataResponseModel = await accountRepository.getUserdata(
          token: dataLocal.token!,
        );
        if (getUserDataResponseModel != null) {
          if (getUserDataResponseModel.status == 200) {
            UserDataEntity? data = getUserDataResponseModel.toUserDataEntity();
            await AccountLocalRepository.saveLocalAccountDataV2(data: data!);
            emit(
              ProfileSuccess(
                userDataModel: data,
              ),
            );
          } else {
            emit(
              ProfileFailed(errorMessage: getUserDataResponseModel.message!),
            );
          }
        } else {
          emit(
            ProfileFailed(errorMessage: "Profile Data Empty"),
          );
        }
      } else {
        emit(
          ProfileFailed(errorMessage: "Failed To Get Profile Data"),
        );
      }
    } catch (errorMessage) {
      emit(
        ProfileFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }

  Future<void> _getProfileDataAction(
    AccountLocalRepository localRepository,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      UserDataEntity? dataEntity = await localRepository.getLocalAccountDataV2();
      if (dataEntity != null) {
        emit(ProfileSuccess(
          userDataModel: dataEntity,
        ));
      } else {
        emit(
          ProfileFailed(errorMessage: "Failed To Get Profile Data"),
        );
      }
    } catch (errorMessage) {
      emit(
        ProfileFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
