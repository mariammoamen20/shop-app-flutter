import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/layout/layout_screen.dart';
import 'package:shop_app/modules/auth/register/cubit/cubit.dart';
import 'package:shop_app/modules/home/widgets/home_widget.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';

/*{status: true, message: تم التسجيل بنجاح,
 data: {name: remo, email: remo@hotmail.com, phone: 345577, id: 53479, image: https://student.valuxapps.com/storage/assets/defaults/user.jpg,
token: pAxpOHvZAGEtdk3xDpItfkMD2vcpb27nFGku9OV37rVeCEQhBOhjeLqs9RqAWwYe03ESCg}}
* */
class RegisterWidget extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.registerModel?.status == true) {
            /* var token = CacheHelper.saveData(key: 'token', value: state.registerModel?.userData?.token);
            print(token);*/
            navigateToAndFinish(context,   LayoutScreen());
          } else {
            showToast(
              message: state.registerModel?.message,
              states: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
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
                    text: 'Register',
                    size: 30.0.sp,
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
                    height: height / 25,
                  ),
                  buildInputFiled(
                    context,
                    text: 'Name',
                    hintText: 'Enter your name',
                    validationText: 'Name  Filed Is Required',
                    controller: nameController,
                    prefixIcon: Icons.person_outline,
                  ),
                  SizedBox(
                    height: height / 25,
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
                    height: height / 25,
                  ),
                  buildInputFiled(
                    context,
                    text: 'Phone',
                    hintText: 'Enter your phone',
                    validationText: 'Phone  Filed Is Required',
                    controller: phoneController,
                    prefixIcon: Icons.phone_android_outlined,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegisterLoadingState,
                    builder: (context) {
                      return defaultButton(
                        width: double.infinity,
                        text: 'Register',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                      );
                    },
                    fallback: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
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
                  SizedBox(
                    height: height / 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultText(
                        text: 'Have already account?',
                        size: 12.0,
                        color: Colors.black54,
                      ),
                      buildDefaultTextButton(
                        onPressed: () {
                          naviagetBack(context);
                        },
                        text: 'Login',
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
