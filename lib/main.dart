import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/bloc_observer.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/layout_screen.dart';
import 'package:shop_app/modules/auth/login/screens/login_screen.dart';
import 'package:shop_app/modules/auth/reset_password/cubit/cubit.dart';
import 'package:shop_app/modules/auth/reset_password/screens/reset_password_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/constants.dart';
import 'package:shop_app/shared/styles/theme.dart';

import 'modules/splash/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  AppConstants.token = CacheHelper.getData(key: 'token') ?? "";
  debugPrint('token main-----------${AppConstants.token}');
  Widget? widget;
  if (AppConstants.token.isEmpty) {
    widget = const LoginScreen();
  } else {
    widget = LayoutScreen();
  }
  runApp(
    MyApp(widget),
  );
}

class MyApp extends StatelessWidget {
  Widget? widget;

  MyApp(this.widget); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home:widget,
          );
        },
      ),
    );
  }
}
