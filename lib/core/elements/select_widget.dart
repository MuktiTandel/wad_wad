import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

Widget selectWidget({
  required VoidCallback onTap,
  required String title,
  required Color backgroundColor,
  required Color textColor
}) {
  return GestureDetector(
    onTap: (){
      onTap();
    },
    child: Container(
      height: 40.h,
      width: 105.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor
      ),
      child: Center(
        child: CustomText(
          text: title,
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
        ),
      ),
    ),
  );
}