import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/auth/register_model.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points.dart';

part 'state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;

  void userLogin({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: EndPoints.REGISTER,
      data: {
        'name':name,
        'email': email,
        'password': password,
        'phone':phone
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(value.data);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
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
