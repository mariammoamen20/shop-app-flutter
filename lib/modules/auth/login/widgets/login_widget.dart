import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/modules/auth/login/cubit/cubit.dart';
import 'package:shop_app/modules/auth/register/screens/register_screen.dart';
import 'package:shop_app/modules/auth/reset_password/screens/reset_password_screen.dart';
import 'package:shop_app/modules/home/screens/home_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:shop_app/shared/styles/constants.dart';

import '../../../../shared/components/components.dart';

class LoginWidget extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel?.status == true) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel?.userData?.token,
            ).then(
              (value) {
                AppConstants.token = state.loginModel?.userData?.token ?? " ";
                print('token---${AppConstants.token}');
                navigateToAndFinish(
                  context,
                  const HomeScreen(),
                );
              },
            );
          } else {
            showToast(
              message: state.loginModel?.message ?? " ",
              states: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(
                    text: 'Login',
                    size: 30.0.sp,
                    fontWeight: FontWeight.bold
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  defaultText(
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                    size: 14.0.sp,
                    maxLines: 3,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  buildInputFiled(
                    context,
                    text: 'Email',
                    hintText: 'your email',
                    validationText: 'Email Filed Is Required',
                    controller: emailController,
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  buildInputFiled(
                    context,
                    text: 'Password',
                    hintText: 'your password',
                    validationText: 'Password Filed Is Required',
                    controller: passwordController,
                    prefixIcon: Icons.lock_clock_outlined,
                    suffixIcon: Icon(cubit.icon),
                    isPassword: cubit.isPassword,
                    suffixPressed: () {
                      cubit.changeVisibility();
                    },
                    //RegisterCubit.get(context).icon
                  ),
                  SizedBox(
                    height: height / 70,
                  ),
                  buildDefaultTextButton(
                    onPressed: () {
                      naviagteTo(context, const ResetPasswordScreen());
                    },
                    text: 'Reset Your Password',

                  ),
                  SizedBox(
                    height: height / 70,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) {
                      return defaultButton(
                        width: double.infinity,
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userAuth(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      );
                    },
                    fallback: (context) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Center(
                    child: defaultText(
                      text: 'Or Continue With',
                      size: 12.0.sp,
                      color: Colors.grey.withOpacity(
                        0.8,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildSocialItem(
                        icon: Icons.g_mobiledata_rounded,
                        size: 40.0,
                      ),
                      buildSocialItem(
                        icon: Icons.facebook_outlined,
                      ),
                      buildSocialItem(
                        icon: Icons.apple_rounded,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultText(
                          text: 'Don\'t have account?',
                          size: 12.0,
                          color: Colors.black54),
                      buildDefaultTextButton(
                        onPressed: () {
                          naviagteTo(
                            context,
                            const RegisterScreen(),
                          );
                        },
                        text: 'Register',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



  Widget buildSocialItem({
    double radius = 25.0,
    Color circleAvatarColor = AppColors.primaryColor,
    required IconData icon,
    Color iconColor = Colors.black,
    double? size,
  }) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: circleAvatarColor,
      child: Icon(
        icon,
        color: iconColor,
        size: size ?? 30.0,
      ),
    );
  }
}
