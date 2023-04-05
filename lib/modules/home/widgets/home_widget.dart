import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/icon_broken.dart';

class HomeWidget extends StatelessWidget {
  var searchController = TextEditingController();
  List<String> banners = [
    'assets/images/banner_2.jpg',
    'assets/images/banner_1.jpeg',
    'assets/images/banner_3.jpeg',
  ];
  List<String> bannerName = [
    'MakeUp & Skin Care',
    'Furniture',
    'Cleaners',
  ];
  List<String> discounts = [
    '70%',
    '30%',
    '50%',
  ];
  List<String> sales = [
    'assets/images/makeup_2.jpg',
    'assets/images/skincare_2.jpg',
    'assets/images/makeup_1.jpg',
    'assets/images/cleaners_2.jpg',
    'assets/images/cleaners_3.jpg',
  ];
  List<String> productName = [
    'Mac Ballet Eyeshadow',
    'Ordinary Serum',
    'Conciler Fitme',
    'Free Cleaner',
    'Aspen Cleaner',
  ];
  List<String> productPrice = [
    '\$550',
    '\$702',
    '\$508',
    '\$156',
    '\$120',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeaderItems(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildProductItem(index) {
    return Column(
      children: [
        Image.asset(sales[index]),
        defaultText(
          text: productPrice[index],
          size: 14.0.sp,
        ),
      ],
    );
  }

  Widget buildBannerItem(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              banners[index],
              width: 230.0.w,
              height: 110.0.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultText(
                  text: bannerName[index],
                  size: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
                defaultText(
                  text: discounts[index],
                  size: 35.0.sp,
                  fontWeight: FontWeight.bold,
                ),
                defaultText(
                  text: 'Buy 2 get 1 free',
                  size: 16.0.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSaleItem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.asset(
                  sales[index],
                  width: 200.0.w,
                  height: 100.0.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsetsDirectional.all(
                    5.0.h,
                  ),
                  width: 70.w,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: defaultText(
                    text: '70% Off',
                    size: 14.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          defaultText(
            text: productName[index],
            size: 14.0.sp,
          ),
          const SizedBox(
            height: 5.0,
          ),
          defaultText(
            text: productPrice[index],
            size: 14.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget buildHeaderItems() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40.0.h,
            child: defaultTextFormFiled(
              text: 'Search',
              fontSize: 14.0.sp,
              radius: 50.0.w,
              textEditingController: TextEditingController(),
              prefixIcon: const Icon(
                IconBroken.Search,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0.w,
        ),
        Container(
          //padding: EdgeInsetsDirectional.all(5.0.w),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(
              10.0.w,
            ),
          ),
          child: IconButton(
            icon: const Icon(
              IconBroken.Filter,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
