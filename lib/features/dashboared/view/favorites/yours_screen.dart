import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/scroll_behavior.dart';

class YoursScreen extends StatelessWidget {
  const YoursScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only( left: 13.w, right: 13.w),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Expanded(
              child: ScrollConfiguration(
                behavior: AppBehavior(),
                child: GridView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.h,
                        mainAxisSpacing: 10.w,
                        childAspectRatio: 2 / 3.2
                    ),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return imageView();
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageView() {
    return SizedBox(
      height: 250.h,
      width: 250.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.dog6,
            ),
          ),
          Positioned(
            top: 5.h,
            left: 5.w,
            child: Container(
              padding: EdgeInsets.all(3.w),
              height: 20.h,
              width: 20.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white30
              ),
              child: Center(
                child: Image.asset(
                  AppImages.fillHeart,
                  color: AppColors.darkOrange,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 6.h,
            left: 5.w,
            child: CustomText(
              text: 'user name, 0 miles',
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
