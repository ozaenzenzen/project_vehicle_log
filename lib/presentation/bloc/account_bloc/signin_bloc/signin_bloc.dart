import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/model/account/signin_request_models.dart';
import 'package:project_vehicle_log/data/model/account/signin_response_models.dart';
import 'package:project_vehicle_log/data/repository/account_repository.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninAction>(_signInAction);
  }

  _signInAction(
    SigninAction event,
    Emitter<SigninState> emit,
  ) async {
    emit(SigninLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      SignInResponseModel signInResponseModel = await AppAccountReposistory.signin(
        event.signInRequestModel,
      );
      if (signInResponseModel.status == 200) {
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
