import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/auth/login/widgets/login_widget.dart';
import 'package:shop_app/modules/auth/register/cubit/cubit.dart';

import '../widgets/register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: RegisterWidget(),
      ),
    );
  }
}
