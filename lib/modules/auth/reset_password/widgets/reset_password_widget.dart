import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/layout/layout_screen.dart';
import 'package:shop_app/modules/auth/reset_password/cubit/cubit.dart';
import 'package:shop_app/modules/home/screens/home_screen.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../../../shared/styles/colors.dart';

class ResetPasswordWidget extends StatelessWidget {
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<ChangePasswordCubit, ChangePasswordStates>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          if (state.status == true) {
            showToast(
              message: state.message ?? " ",
              states: ToastStates.SUCCESS,
            );
            navigateToAndFinish(context, LayoutScreen());
          } else {
            showToast(
              message: state.message,
              states: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ChangePasswordCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(
                    text: 'Reset Password',
                    size: 30.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  buildInputFiled(
                    context,
                    text: 'Password',
                    hintText: 'enter your password',
                    validationText: 'password must not be empty',
                    controller: currentPasswordController,
                    prefixIcon: Icons.lock_clock_outlined,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  buildInputFiled(
                    context,
                    text: 'Reset Password',
                    hintText: 'confirm your password',
                    validationText: 'password must not be empty',
                    controller: newPasswordController,
                    prefixIcon: Icons.lock_clock_outlined,
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  ConditionalBuilder(
                    condition: state is! ChangePasswordLoadingState,
                    builder: (context) => defaultButton(
                      width: double.infinity,
                      text: 'Reset Password',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.changePassword(
                            currentPassword: currentPasswordController.text,
                            newPassword: newPasswordController.text,
                          );
                        }
                      },
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
