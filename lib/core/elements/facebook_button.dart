import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    Key? key,
    required this.onTap
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 45.h,
      child: ElevatedButton(
          onPressed: (){
            onTap();
          },
        style:  ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            padding: EdgeInsets.zero,
            elevation: 0,
          backgroundColor: AppColors.blue
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 16.w),
                child: Image.asset(
                    AppImages.facebook,
                  height: 20.h,
                ),
              ),
              Expanded(child: SizedBox(width: 10.w,)),
              Padding(
                padding:  EdgeInsets.only(right: 22.w),
                child: CustomText(
                    text: AppStrings.cwFacebook,
                  fontSize: 13.sp,
                ),
              ),
              Expanded(child: SizedBox(width: 10.w,))
            ],
          ),
      ),
    );
  }
}
