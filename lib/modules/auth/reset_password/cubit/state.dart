part of 'cubit.dart';

@immutable
abstract class ChangePasswordStates {}

class ChangePasswordInitialState extends ChangePasswordStates {}

class ChangePasswordLoadingState extends ChangePasswordStates {}

class ChangePasswordSuccessState extends ChangePasswordStates {
  bool? status;
  String? message;

  ChangePasswordSuccessState(this.status,this.message){
  }
}
class ChangePasswordErrorState extends ChangePasswordStates {
  final String message ;

  ChangePasswordErrorState(this.message);

}
