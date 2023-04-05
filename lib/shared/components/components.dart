import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';

Widget defaultText({
  required String text,
  required double size,
  TextAlign textAlign = TextAlign.start,
  Color color = Colors.black,
  TextOverflow textOverflow = TextOverflow.ellipsis,
  int? maxLines,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: textOverflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Widget defaultButton({
  required double width,
  required String text,
  required void Function()? onPressed,
}) {
  return MaterialButton(
    color: Colors.black,
    // minWidth: 120.0.w,
    minWidth: width,
    padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
    onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: defaultText(
        text: text,
        size: 14.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700),
  );
}

void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

Widget defaultTextFormFiled({
  required String text,
  double fontSize = 10.0,
  Color color = AppColors.textFormFiledColor,
  required double radius,
  required TextEditingController textEditingController,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  TextInputType? inputType,
  bool isPassword = false,
  Widget? suffixIcon,
  void Function()? suffixPressed,
  Widget? prefixIcon,
}) {
  return TextFormField(
    textAlignVertical: TextAlignVertical.bottom,
    cursorColor: Colors.black,
    style: TextStyle(fontSize: 14.0.sp),
    validator: validator,
    controller: textEditingController,
    onChanged: onChanged,
    keyboardType: inputType,
    obscureText: isPassword,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.textFormFiledColor,
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: suffixIcon,
            )
          : null,
      prefixIcon: prefixIcon,
      hintStyle: TextStyle(fontSize: fontSize.sp, fontWeight: FontWeight.w100),
      hintText: text,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(
          radius.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(
          radius.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(
          radius.w,
        ),
      ),
    ),
  );
}

Widget buildDefaultTextButton({
  required void Function() onPressed,
  required String text,
  double size = 12.0,
}) {
  return TextButton(
    //new thing i learnt now TextButton.styleFrom
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
    onPressed: onPressed,
    child: defaultText(
        text: text,
        size: size.sp,
        color: Colors.black54,
        fontWeight: FontWeight.bold),
  );
}

void naviagteTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void naviagetBack(context) => Navigator.pop(context);

void showToast({required String? message, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: message ?? "",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
Widget buildInputFiled(
    context, {
      required String text,
      required String hintText,
      required String validationText,
      required TextEditingController controller,
      required IconData prefixIcon,
      bool isPassword = false,
      Widget? suffixIcon,
      void Function()? suffixPressed,
    }) {
  var height = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      defaultText(
        text: text,
        size: 14.0.sp,
        color: Colors.black54,
      ),
      SizedBox(
        height: height / 80,
      ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.textFormFiledColor,
          borderRadius: BorderRadius.circular(
            50.0.w,
          ),
        ),
        child: defaultTextFormFiled(
          suffixPressed: suffixPressed,
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          prefixIcon: Icon(
            prefixIcon,
            size: 20.0.w,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return validationText;
            }
            return null;
          },
          text: hintText,
          radius: 50.0,
          textEditingController: controller,
        ),
      ),
    ],
  );
}