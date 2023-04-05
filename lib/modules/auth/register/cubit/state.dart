part of 'cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterModel? registerModel;

  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  final String message;

  RegisterErrorState(this.message);
}

class ChangeVisibilityState extends RegisterStates{}