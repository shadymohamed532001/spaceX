import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/font_weight_helper.dart';

class AppStyle {
  // Black Color Styles
  static TextStyle font14Blacksemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font10WhiteRegular = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.white,
  );

  // Grey Color Styles

  static TextStyle font15Greysemibold = TextStyle(
    color: ColorManger.greyColor.withOpacity(0.4),
    fontSize: 15.sp,
  );
  // Primary Color Styles

  // White Color Styles
  static TextStyle font14Whitesemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorManger.whiteColor,
  );
  static TextStyle font18Whitesemibold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorManger.whiteColor,
  );
}
