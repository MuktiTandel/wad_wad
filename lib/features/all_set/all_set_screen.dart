import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(12.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox(height: 10.h,)),
              CustomText(
                  text: AppStrings.aSet,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 80.h,),
              SizedBox(
                width: 220.w,
                height: 180.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.group,
                      height: 160.h,
                      width: 180.w,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        AppImages.vector,
                        height: 110.h,
                        width: 140.w,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox(height: 10.h,)),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: CustomButton(
                  height: 50.h,
                    fontSize: 15.sp,
                    onTap: (){},
                    buttonText: AppStrings.lGo
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
