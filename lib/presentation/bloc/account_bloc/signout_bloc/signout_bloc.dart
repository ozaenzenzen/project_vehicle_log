// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_vehicle_log/data/local_repository.dart';

part 'signout_event.dart';
part 'signout_state.dart';

class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  SignoutBloc() : super(SignoutInitial()) {
    on<SignoutEvent>((event, emit) {
      if (event is SignoutAction) {
        _signOutAction();
      }
    });
  }
  Future<void> _signOutAction() async {
    emit(SignoutLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      await AccountLocalRepository.removeLocalAccountData();
      await AccountLocalRepository.signOutSaved();
      emit(SignoutSuccess());
    } catch (errorMessage) {
      emit(
        SignoutFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
