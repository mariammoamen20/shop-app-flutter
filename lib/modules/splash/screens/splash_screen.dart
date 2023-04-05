import 'package:flutter/material.dart';
import 'package:shop_app/modules/splash/widgets/splash_widget.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: const SplashWidget(),
    );
  }
}
