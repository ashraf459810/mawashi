part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}



class RegisterNewUserEvent extends RegisterEvent{
  final RegisterRequestBody registerRequestBody;

  RegisterNewUserEvent(this.registerRequestBody);
}