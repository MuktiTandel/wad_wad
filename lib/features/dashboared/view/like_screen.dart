import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/features/dashboared/controller/like_controller.dart';

class LikeScreen extends StatelessWidget {
   LikeScreen({Key? key}) : super(key: key);

   final controller = Get.put(LikeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.favorites,
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => selectWidget(
                  onTap: (){
                    if ( controller.isYours.value == false ) {
                      controller.isYours.value = true;
                      controller.isReceived.value = false;
                      controller.isMutual.value = false;
                    } else {
                      controller.isYours.value = false;
                    }
                    },
                  color: controller.isYours.value == false ? AppColors.gray : AppColors.orange,
                  text: AppStrings.your,
                isSelect: controller.isYours.value
              )
              ),
              SizedBox(width: 10.w,),
              Obx(() => selectWidget(
                  onTap: (){
                    if ( controller.isReceived.value == false ) {
                      controller.isReceived.value = true;
                      controller.isYours.value = false;
                      controller.isMutual.value = false;
                    } else {
                      controller.isReceived.value = false;
                    }
                  },
                  color: controller.isReceived.value == false ? AppColors.gray : AppColors.orange,
                  text: AppStrings.received,
                  isSelect: controller.isReceived.value
              )
              ),
              SizedBox(width: 10.w,),
              Obx(() => selectWidget(
                  onTap: (){
                    if ( controller.isMutual.value == false ) {
                      controller.isMutual.value = true;
                      controller.isYours.value = false;
                      controller.isReceived.value = false;
                    } else {
                      controller.isMutual.value = false;
                    }
                  },
                  color: controller.isMutual.value == false ? AppColors.gray : AppColors.orange,
                  text: AppStrings.mutuals,
                  isSelect: controller.isMutual.value
              )
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget selectWidget({required VoidCallback onTap, required Color color, required String text, required bool isSelect}) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: text,
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
              SizedBox(width: 2.w,),
              Image.asset(
                AppImages.fillHeart,
                height: 12.h,
                width: 12.w,
                color: color,
              )
            ],
          ),
          SizedBox(height: 1.h,),
          isSelect == true ? Container(
            height: 1.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(10)
            ),
          ) :  SizedBox(width: 80.w, height: 1.h,)
        ],
      ),
    );
  }
}
