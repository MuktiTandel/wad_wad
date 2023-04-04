import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              side: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            padding: EdgeInsets.zero,
            elevation: 0,
          backgroundColor: Colors.transparent
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 16.w),
                child: Image.asset(
                  AppImages.google,
                  height: 20.h,
                ),
              ),
              Expanded(child: SizedBox(width: 10.w,)),
              Padding(
                padding:  EdgeInsets.only(right: 22.w),
                child: CustomText(
                  text: AppStrings.cwGoogle,
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
              ),
              Expanded(child: SizedBox(width: 10.w,))

            ],
          ),
      ),
    );
  }
}
