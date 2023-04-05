part of 'cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  RegisterModel? loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String message;

  LoginErrorState(this.message);
}

class ChangeVisibilityState extends LoginStates{}