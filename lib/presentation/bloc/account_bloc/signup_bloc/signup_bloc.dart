// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository.dart';
import 'package:project_vehicle_log/data/model/account/signup_request_models.dart';
import 'package:project_vehicle_log/data/model/account/signup_response_models.dart';
import 'package:project_vehicle_log/data/model/account_user_data_model.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(AppAccountReposistory appAccountReposistory) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      if (event is SignupAction) {
        _signInAction(appAccountReposistory, event);
      }
    });
  }
  Future<void> _signInAction(
    AppAccountReposistory appAccountReposistory,
    SignupAction event,
  ) async {
    emit(SignupLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      SignUpResponseModel signUpResponseModel = await appAccountReposistory.signup(
        event.signUpRequestModel,
      );
      if (signUpResponseModel.status == 201) {
        AccountDataUserModel data = AccountDataUserModel(
          userId: signUpResponseModel.accountData?.userId,
          name: signUpResponseModel.accountData?.name,
          email: signUpResponseModel.accountData?.email,
          phone: signUpResponseModel.accountData?.phone,
          link: signUpResponseModel.accountData?.link,
          typeuser: signUpResponseModel.accountData?.typeuser,
        );
        await LocalRepository.saveLocalAccountData(data: data);
        await LocalRepository.signInSaved();
        emit(
          SignupSuccess(
            signUpResponseModel: signUpResponseModel,
          ),
        );
      } else {
        emit(
          SignupFailed(
            errorMessage: signUpResponseModel.message.toString(),
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
