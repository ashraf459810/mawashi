part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class Loading extends RegisterState{}


class Error extends RegisterState{
  final String error;

  Error(this.error);
}


class RegisterNewUserState extends RegisterState {
  final RegisterResponseModel registerResponseModel;

  RegisterNewUserState(this.registerResponseModel);
}