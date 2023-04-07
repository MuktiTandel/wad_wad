import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

Widget selectImageWidget({
  required VoidCallback onTap,
  required String title,
  required String subTitle,
  EdgeInsets? padding,
  }) {
  return Padding(
    padding: padding ?? EdgeInsets.all(12.w),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap();
      },
      child: Container(
        height: 150.h,
        width: Get.width,
        padding: EdgeInsets.only(left: 15.w,right: 15.w),
        child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: const [6],
            strokeWidth: 1.w,
            radius: const Radius.circular(10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Image.asset(
                          AppImages.upload,
                          height: 28.h,
                        )
                    ),
                    Column(
                      children: [
                        Center(
                          child: CustomText(
                            text: title,
                            fontSize: 13.sp,
                            color: AppColors.gray1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Center(
                          child: CustomText(
                            text: subTitle,
                            fontSize: 13.sp,
                            color: AppColors.gray1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            )
        ),
      ),
    ),
  );
}