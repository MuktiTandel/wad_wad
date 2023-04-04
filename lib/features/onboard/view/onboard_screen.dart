import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/routes/app_pages.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.onboardBackground,
        body: Stack (
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                  AppImages.onboard,
                height: 522.h,
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 50.h,
                left: 10.w,
                child: Image.asset(
                    AppImages.logo,
                  height: 45.h,
                  width: 95.w,
                )
            ),
            Padding(
              padding:  EdgeInsets.all(12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                      text: 'Want a Dog? Walk a Dog! is a '
                          'community of thousands of members '
                          'that connects doggie owners with people'
                          ' who don’t have dogs but love them.',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  SizedBox(height: 18.h,),
                  CustomButton(
                    height: 45.h,
                      onTap: (){
                      Get.toNamed(AppPages.SIGNUP);
                      },
                      buttonText: AppStrings.onboardButtonText
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: AppStrings.alreadyLogin,
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomText(
                            text: " ${AppStrings.login}",
                          color: AppColors.darkOrange,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h,)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
