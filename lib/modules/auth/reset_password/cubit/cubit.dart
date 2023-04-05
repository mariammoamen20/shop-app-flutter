import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/auth/reset_password.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/constants.dart';

part 'state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  //ResetPasswordModel? resetPasswordModel;
  bool? status;
  String? message;

  void changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(
      url: EndPoints.CHANGE_PASSWORD,
      data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
      token: AppConstants.token,
    ).then(
      (value) {
        // resetPasswordModel = ResetPasswordModel.fromJson(value.data);
        status = value.data['status'];
        message = value.data['message'];
        debugPrint('status-------->$status');
        emit(ChangePasswordSuccessState(status,message));
      },
    ).catchError((error) {
      debugPrint(error.toString());
      emit(ChangePasswordErrorState(error.toString()));
    });
  }
}
