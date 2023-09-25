// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/local/account_user_data_model.dart';
import 'package:project_vehicle_log/data/model/remote/account/get_userdata_response_models.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/domain/entities/user_data_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(AccountLocalRepository localRepository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      if (event is GetProfileLocalAction) {
        _getProfileDataAction(localRepository);
      }
      if (event is GetProfileRemoteAction) {
        _getProfileRemoteAction(event.accountReposistory);
      }
    });
  }
  Future<void> _getProfileRemoteAction(
    AppAccountReposistory accountReposistory,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      AccountDataUserModel? dataLocal = await AccountLocalRepository().getLocalAccountData();
      if (dataLocal != null) {
        GetUserDataResponseModel? getUserDataResponseModel = await accountReposistory.getUserdata(
          token: dataLocal.token!,
        );
        if (getUserDataResponseModel != null) {
          if (getUserDataResponseModel.status == 200) {
            emit(
              ProfileSuccess(
                userDataModel: UserDataModel.fromJson(
                  getUserDataResponseModel.userdata!.toJson(),
                ),
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
      AccountDataUserModel? accountDataUserModel = await localRepository.getLocalAccountData();
      if (accountDataUserModel != null) {
        emit(ProfileSuccess(
          userDataModel: UserDataModel.fromJson(
            accountDataUserModel.toJson(),
          ),
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
