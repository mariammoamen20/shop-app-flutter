import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';

import '../modules/auth/profile/profile_screen.dart';
import '../modules/carts/cart_screen.dart';
import '../modules/categories/category_screen.dart';
import '../modules/favourites/favourit_screen.dart';
import '../modules/home/screens/home_screen.dart';
import '../shared/styles/icon_broken.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);

  List<BottomNavigationBarItem> bottoms = [
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Category,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Bag_2,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Heart,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Profile,
      ),
      label: '',
    ),
  ];
  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          //appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: bottoms,
            onTap: (index) {
              cubit.changeBottomNavIndex(index);
            },
          ),
          body: screens[cubit.currentIndex],
        );
      },
    );
  }
}
