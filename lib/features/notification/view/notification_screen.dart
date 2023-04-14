import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding:  EdgeInsets.all(12.w),
          child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child:
              Image.asset(
                AppImages.arrowLeft,
              )
          ),
        ),
        title: CustomText(
          text: AppStrings.notifications,
          color: Colors.black,
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Image.asset(
          AppImages.dog5,
          height: 200.h,
          width: 200.w,
          color: AppColors.lightGray,
        ),
      ),
    );
  }
}

