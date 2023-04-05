import 'package:flutter/material.dart';
import 'package:shop_app/modules/home/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeWidget(),
    );
  }
}
