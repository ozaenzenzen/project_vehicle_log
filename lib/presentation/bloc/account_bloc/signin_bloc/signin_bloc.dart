// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/account_local_repository.dart';
import 'package:project_vehicle_log/data/model/account/signin_request_models.dart';
import 'package:project_vehicle_log/data/model/account/signin_response_models.dart';
import 'package:project_vehicle_log/data/model/account_user_data_model.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc(AppAccountReposistory accountReposistory) : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {
      if (event is SigninAction) {
        _signInAction(accountReposistory, event);
      }
    });
  }

  Future<void> _signInAction(
    AppAccountReposistory accountReposistory,
    SigninAction event,
  ) async {
    emit(SigninLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      SignInResponseModel signInResponseModel = await accountReposistory.signin(
        event.signInRequestModel,
      );
      if (signInResponseModel.status == 200) {
        AccountDataUserModel data = AccountDataUserModel(
          userId: signInResponseModel.userdata?.id,
          name: signInResponseModel.userdata?.name,
          email: signInResponseModel.userdata?.email,
          phone: signInResponseModel.userdata?.phone,
          link: signInResponseModel.userdata?.link,
          typeuser: signInResponseModel.userdata?.typeuser,
        );
        await AccountLocalRepository.saveLocalAccountData(data: data);
        await AccountLocalRepository.signInSaved();
        emit(
          SigninSuccess(
            userdata: signInResponseModel.userdata!,
          ),
        );
      } else {
        emit(
          SigninFailed(
            errorMessage: signInResponseModel.message.toString(),
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        SigninFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
