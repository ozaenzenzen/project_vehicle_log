// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/remote/account/signup_request_models.dart';
import 'package:project_vehicle_log/data/model/remote/account/signup_response_models.dart';
import 'package:project_vehicle_log/data/model/local/account_user_data_model.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(AppAccountReposistory appAccountReposistory) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      if (event is SignupAction) {
        _signUpAction(appAccountReposistory, event);
      }
    });
  }
  Future<void> _signUpAction(
    AppAccountReposistory appAccountReposistory,
    SignupAction event,
  ) async {
    emit(SignupLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      SignUpResponseModel? signUpResponseModel = await appAccountReposistory.signup(
        event.signUpRequestModel,
      );
      if (signUpResponseModel != null) {
        if (signUpResponseModel.status == 201) {
          AccountDataUserModel data = AccountDataUserModel(
            userId: signUpResponseModel.accountData?.userId,
            name: signUpResponseModel.accountData?.name,
            email: signUpResponseModel.accountData?.email,
            phone: signUpResponseModel.accountData?.phone,
            // link: signUpResponseModel.accountData?.link,
            // typeuser: signUpResponseModel.accountData?.typeuser,
          );
          await AccountLocalRepository.saveLocalAccountData(data: data);
          await AccountLocalRepository.signInSaved();
          emit(
            SignupSuccess(
              signUpResponseModel: signUpResponseModel,
            ),
          );
        } else {
          var errorMessage = "";
          if (signUpResponseModel.message.toString().contains('required')) {
            errorMessage = "terdapat field kosong";
          } else {
            errorMessage = signUpResponseModel.message.toString();
          }
          emit(
            SignupFailed(
              errorMessage: errorMessage,
            ),
          );
        }
      } else {
        emit(
          SignupFailed(
            errorMessage: "Terjadi kesalahan, data kosong",
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        SignupFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
