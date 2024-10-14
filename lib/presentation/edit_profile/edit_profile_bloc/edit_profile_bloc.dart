// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/edit_profile/request/edit_profile_request_model.dart';
import 'package:project_vehicle_log/data/model/remote/edit_profile/response/edit_profile_response_model.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';
import 'package:project_vehicle_log/domain/entities/user_data_entity.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(AppAccountReposistory accountReposistory) : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) {
      if (event is EditProfileAction) {
        _editProfileAction(accountReposistory, event);
      }
    });
  }

  Future<void> _editProfileAction(
    AppAccountReposistory accountReposistory,
    EditProfileAction editProfileAction,
  ) async {
    emit(EditProfileLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      UserDataEntity? data = await AccountLocalRepository().getLocalAccountData();
      EditProfileResponseModel? editProfileResponseModel = await accountReposistory.editProfile(
        token: data!.token!,
        data: editProfileAction.editProfileRequestModel,
      );
      if (editProfileResponseModel != null) {
        if (editProfileResponseModel.status == 202) {
          emit(EditProfileSuccess(
            editProfileResponseModel: editProfileResponseModel,
          ));
        } else {
          emit(
            EditProfileFailed(errorMessage: editProfileResponseModel.message),
          );
        }
      } else {
        emit(
          EditProfileFailed(errorMessage: "Failed edit profile"),
        );
      }
    } catch (errorMessage) {
      emit(
        EditProfileFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
