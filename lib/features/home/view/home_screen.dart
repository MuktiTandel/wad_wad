import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/features/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(13.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStrings.wLDogs,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    CustomText(
                      text: AppStrings.tUSAbout,
                      color: AppColors.gray,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text: " ${AppStrings.you}",
                      color: AppColors.darkOrange,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                SizedBox(height: 25.h,),
                CustomText(
                  text: ' ${homeController.count.value}/3',
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                ),
                SizedBox(height: 8.h,),
                SizedBox(
                  height: 3.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppColors.lightOrange,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.lightGray,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.lightGray,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 60.h,),
                selectWidget(
                    image: AppImages.dog1,
                    title: AppStrings.dOwner,
                    onTap: (){}
                ),
                SizedBox(height: 5.h,),
                const Center(
                    child: CustomText(
                      text:"(${AppStrings.eYDoggie})",
                      color: AppColors.gray,
                    )
                ),
                SizedBox(height: 20.h,),
                selectWidget(
                    image: AppImages.dog2,
                    title: AppStrings.dBorrower,
                    onTap: (){}
                ),
                SizedBox(height: 5.h,),
                const Center(
                    child: CustomText(
                      text:"(${AppStrings.mDoggies})",
                      color: AppColors.gray,
                    )
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Obx(() => CustomButton(
              height: 52.h,
              width: 300.w,
              borderRadius: 16,
              onTap: (){},
              buttonText: AppStrings.next,
              fontSize: 15.sp,
              isHome: true,
              isSelect: homeController.isSelect.value,
            ))
          ],
        ),
      ),
    );
  }

  Widget selectWidget({
    required String image,
    required String title,
    required VoidCallback onTap
  }) {
    return Center(
      child: GestureDetector(
        onTap: (){
          homeController.isSelect.value = true;
          onTap();
        },
        child: Container(
          height: 50.h,
          width: 320.w,
          decoration: BoxDecoration(
              color: AppColors.lightGray.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.orange, width: 2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 10.w,),
              Image.asset(
                image,
                height: 30.h,
              ),
              CustomText(
                text: title,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(width: 10.w,),
            ],
          ),
        ),
      ),
    );
  }
}
