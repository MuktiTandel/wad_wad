import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

ShowDialog(BuildContext context, String title, String buttonText ) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title:  CustomText(
            text: title,
            fontWeight: FontWeight.w500,
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: CustomText(
                  text: buttonText,
                  fontSize: 14.sp,
                ))
          ],
        );
      });
}