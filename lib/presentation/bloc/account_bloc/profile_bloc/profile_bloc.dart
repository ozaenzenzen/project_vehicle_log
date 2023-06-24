// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/account_user_data_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(AccountLocalRepository localRepository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      if (event is GetProfileDataAction) {
        _getProfileDataAction(localRepository);
      }
    });
  }
  Future<void> _getProfileDataAction(
    AccountLocalRepository localRepository,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      AccountDataUserModel accountDataUserModel = await localRepository.getLocalAccountData();
      if (accountDataUserModel != null) {
        emit(ProfileSuccess(
          accountDataUserModel: accountDataUserModel,
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
