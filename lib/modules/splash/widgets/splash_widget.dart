import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/modules/auth/login/screens/login_screen.dart';

import '../../../core/assets_manger.dart';
import '../../../shared/components/components.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(height / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultText(
                text: 'Back To Work Collection 2023',
                size: 30.0.sp,
                maxLines: 2,
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
                height: height / 20,
              ),
              defaultButton(
                  width: 120.w,
                  text: 'Get  Started',
                  onPressed: () {
                    navigateToAndFinish(
                      context,
                      const LoginScreen(),
                    );
                  }),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(
            AssetsManger.splash,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
