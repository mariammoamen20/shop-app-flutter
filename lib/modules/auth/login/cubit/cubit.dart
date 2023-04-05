import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/auth/register_model.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  RegisterModel? loginModel;

  void userAuth({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: EndPoints.LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = RegisterModel.fromJson(value.data);
      print(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
  bool isPassword = false;
  IconData icon = Icons.visibility_off_outlined;
  void changeVisibility(){
    isPassword = !isPassword;
    !isPassword ? icon = Icons.visibility_outlined : icon = Icons.visibility_off_outlined;
    emit(ChangeVisibilityState());
  }
}
