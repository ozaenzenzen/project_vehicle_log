part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final AccountDataUserModel accountDataUserModel;

  ProfileSuccess({
    required this.accountDataUserModel,
  });
}

class ProfileFailed extends ProfileState {
  final String errorMessage;

  ProfileFailed({
    required this.errorMessage,
  });
}

class ProfileLoading extends ProfileState {}
