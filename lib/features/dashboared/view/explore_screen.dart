import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/features/dashboared/controller/explore_controller.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({Key? key}) : super(key: key);

   final controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: AppStrings.eDW,
                fontSize: 13.sp,
                color: AppColors.gray,
                fontWeight: FontWeight.w500,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))
                    ),
                      context: context,
                      builder: ( BuildContext context ) {
                          return bottomSheetWidget();
                      }
                  );
                },
                child: Image.asset(
                    AppImages.filter,
                  height: 15.h,
                  width: 15.w,
                ),
              )
            ],
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return walkersProfile();
                }
            ),
          )
        ],
      )
    );
  }

  Widget text({required String text}) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 9.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget walkersProfile() {
    return Container(
      height: 150.h,
      width: 150.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.lightGray.withOpacity(0.5)
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            left : 1.w,
            child: Row(
              children: [
                SizedBox(
                    width : 30.w,
                    child: text(text: "${AppStrings.name},")),
                SizedBox(width: 5.w,),
                SizedBox(
                    width: 40.w,
                    child: text(text: "0 ${AppStrings.miles}"))
              ],
            ),
          ),
          Positioned(
            top: 15.h,
            child: Image.asset(
              AppImages.dog4,
              width: 162.w,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 30.w,
            top: 2.h,
            child: GestureDetector(
              onTap: (){},
              child: Image.asset(
                AppImages.message1,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 2.h,
            child: GestureDetector(
                onTap: (){},
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.rectangle,
                      height: 20.h,
                      width: 20.w,
                    ),
                    Center(
                      child: Image.asset(
                        AppImages.heart1,
                        height: 13.h,
                        width: 13.w,
                      ),
                    )
                  ],
                )
            ),
          ),
          Positioned(
            top: 15.h,
              left: 2.w,
              child: Row(
            children: [
              starWidget(),
              starWidget(),
              starWidget()
            ],
          ))
        ],
      ),
    );
  }

  Widget starWidget() {
    return Image.asset(
      AppImages.star,
      height: 12.h,
      width: 12.w,
    );
  }

  Widget bottomSheetWidget() {
    return Container(
      height: 320.h,
      padding: EdgeInsets.all(13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 3.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: AppStrings.filter,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Get.back();
                },
                child: Image.asset(
                  AppImages.close,
                  height: 15.h,
                  width: 15.w,
                ),
              )
            ],
          ),
          SizedBox(height: 20.h,),
          CustomText(
              text: AppStrings.availability,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8.h,),
          Row(
            children: [
              Obx(() => selectWidget(
                  select: controller.isWeekDay.value == false ? AppImages.unselectRound : AppImages.selectRound,
                  onTap: (){
                    if ( controller.isWeekDay.value == false ) {
                      controller.isWeekDay.value = true;
                      controller.isWeekend.value = false;
                    } else {
                      controller.isWeekDay.value = false;
                    }
                  },
                  title: AppStrings.wDays
              ),),
              SizedBox(width: 10.w,),
              Obx(() => selectWidget(
                  select: controller.isWeekend.value == false ? AppImages.unselectRound : AppImages.selectRound,
                  onTap: (){
                    if( controller.isWeekend.value == false ) {
                      controller.isWeekend.value = true;
                      controller.isWeekDay.value = false;
                    } else {
                      controller.isWeekend.value = false;
                    }
                  },
                  title: AppStrings.weekend
              ))
            ],
          ),
          SizedBox(height: 15.h,),
          CustomText(
            text: AppStrings.eLevel,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Obx(() => selectWidget(
                  select: controller.isMT2Y.value == false ? AppImages.unselectRound : AppImages.selectRound,
                  onTap: (){
                    if( controller.isMT2Y.value == false ) {
                      controller.isMT2Y.value = true;
                      controller.isMT5Y.value = false;
                      controller.isMT8Y.value = false;
                      controller.isMT10Y.value = false;
                    } else {
                      controller.isMT2Y.value = false;
                    }
                  },
                  title: AppStrings.mT2Y
              ),),
              SizedBox(width: 20.w,),
              Obx(() => selectWidget(
                  select: controller.isMT5Y.value == false ? AppImages.unselectRound : AppImages.selectRound,
                  onTap: (){
                    if( controller.isMT5Y.value == false ) {
                      controller.isMT5Y.value = true;
                      controller.isMT2Y.value = false;
                      controller.isMT8Y.value = false;
                      controller.isMT10Y.value = false;
                    } else {
                      controller.isMT5Y.value = false;
                    }
                  },
                  title: AppStrings.mT5Y
              ))
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Obx(() => selectWidget(
                  select: controller.isMT8Y.value == false ? AppImages.unselectRound : AppImages.selectRound,
                  onTap: (){
                    if( controller.isMT8Y.value == false ) {
                      controller.isMT8Y.value = true;
                      controller.isMT2Y.value = false;
                      controller.isMT5Y.value = false;
                      controller.isMT10Y.value = false;
                    } else {
                      controller.isMT8Y.value = false;
                    }
                  },
                  title: AppStrings.mT8Y
              ),),
              SizedBox(width: 20.w,),
              Obx(() => selectWidget(
                  select: controller.isMT10Y.value == false ? AppImages.unselectRound : AppImages.selectRound,
                  onTap: (){
                    if( controller.isMT10Y.value == false ) {
                      controller.isMT10Y.value = true;
                      controller.isMT2Y.value = false;
                      controller.isMT5Y.value = false;
                      controller.isMT8Y.value = false;
                    } else {
                      controller.isMT10Y.value = false;
                    }
                  },
                  title: AppStrings.mT10Y
              ))
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 140.w,
                borderRadius: 30,
                height: 45.h,
                fontWeight: FontWeight.w500,
                isHome: true,
                  backgroundColor: AppColors.orange,
                  onTap: (){
                    Get.back();
                  },
                  buttonText: AppStrings.save
              ),
              SizedBox(width: 10.w,),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Get.back();
                },
                child: CustomText(
                    text: AppStrings.clear,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.gray,
                ),
              ),
              SizedBox(width: 10.w,)
            ],
          )
        ],
      ),
    );
  }

  Widget selectWidget( { required String select,
    required VoidCallback onTap,
    required String title}) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            onTap();
          },
          child: Image.asset(
            select,
            height: 18.h,
            width: 18.w,
          ),
        ),
        SizedBox(width: 8.w,),
        CustomText(
            text: title,
         fontSize: 13.sp,
          color: AppColors.gray,
        )
      ],
    );
  }
}
