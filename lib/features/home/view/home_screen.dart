import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/custom_textfield.dart';
import 'package:wad_wad/core/elements/scroll_behavior.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/features/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScaffold(
          body: Builder(
              builder: (context) => CupertinoPageScaffold(
                  child: ScrollConfiguration(
                    behavior: AppBehavior(),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(13.w),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
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
                                    Obx(() =>  CustomText(
                                      text: ' ${homeController.count.value}/3',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.gray,
                                    )),
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
                                          Obx(() =>  Expanded(
                                            child: Container(
                                              color: homeController.isSelect.value == false
                                                  ? AppColors.lightGray
                                                  : AppColors.lightOrange,
                                            ),
                                          ),),
                                         Obx(() =>  Expanded(
                                           child: Container(
                                             color: homeController.isAgree.value == false
                                                 ? AppColors.lightGray
                                                 : AppColors.lightOrange,
                                           ),
                                         ))
                                        ],
                                      ),
                                    ),
                                    Obx(() => homeController.isAgree.value == false ? selectOwnerBorrower() : addressView())
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                                Obx(() => CustomButton(
                                  height: 52.h,
                                  width: 300.w,
                                  borderRadius: 16,
                                  onTap: (){
                                    homeController.isAgree.value == false ? homeController.isSelect.value == true ? CupertinoScaffold.showCupertinoModalBottomSheet(
                                        context: context,
                                        expand: true,
                                        builder: (context) {
                                          return homeController.isDogOwner.value == true
                                              ? bottomSheetWidget(
                                              title: AppStrings.tMPact,
                                            subTitle: AppStrings.oPact,
                                            onTap: (){},
                                            desc: ownerPact(),
                                            color: AppColors.orange1
                                          ) : bottomSheetWidget(
                                            title: AppStrings.tBPact,
                                            subTitle: AppStrings.bPact,
                                            onTap: (){},
                                            desc: borrowerPact(),
                                            color: AppColors.orange2
                                          );
                                        }
                                    ) : null : Get.offNamed(AppPages.ADDDOGPROFILE);
                                  },
                                  buttonText: AppStrings.next,
                                  fontSize: 15.sp,
                                  isHome: true,
                                  isSelect: homeController.isSelect.value,
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )))
      ),
    );
  }

  Widget selectOwnerBorrower() {
    return Column(
      children: [
        SizedBox(height: 60.h,),
        Obx(() =>   selectWidget(
            image: AppImages.dog1,
            title: AppStrings.dOwner,
            onTap: (){
              if(homeController.isDogOwner.value == false ) {
                homeController.isDogOwner.value = true;
              }
              if ( homeController.isDogBorrower.value == true ) {
                homeController.isDogBorrower.value = false;
              }
            },
            border: homeController.isDogOwner.value == true
                ? Border.all(color: AppColors.orange, width: 2)
                : const Border()
        ),),
        SizedBox(height: 5.h,),
        const Center(
            child: CustomText(
              text:"(${AppStrings.eYDoggie})",
              color: AppColors.gray,
            )
        ),
        SizedBox(height: 20.h,),
        Obx(() => selectWidget(
            image: AppImages.dog2,
            title: AppStrings.dBorrower,
            onTap: (){
              if ( homeController.isDogBorrower.value == false ) {
                homeController.isDogBorrower.value = true;
              }
              if ( homeController.isDogOwner.value == true ) {
                homeController.isDogOwner.value = false;
              }
            },
            border: homeController.isDogBorrower.value == true
                ? Border.all(color: AppColors.orange, width: 2)
                : const Border()
        )),
        SizedBox(height: 5.h,),
        const Center(
            child: CustomText(
              text:"(${AppStrings.mDoggies})",
              color: AppColors.gray,
            )
        ),
      ],
    );
  }

  Widget addressView() {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Obx(() => CustomTextField(
          controller: homeController.addressController,
          hintText: AppStrings.address,
          labelPadding: homeController.isAddress.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
          isType: homeController.addressType.value,
          onchange: (val){
            if(val.isNotEmpty) {
              homeController.isAddress.value = true;
              homeController.addressType.value = true;
              if ( homeController.postalCodeController.value.text.isEmpty ) {
                homeController.isPostalCode.value = false;
                homeController.postalCodeType.value = false;
              }
              if ( homeController.suiteController.value.text.isEmpty ) {
                homeController.isSuite.value = false;
                homeController.suiteType.value = false;
              }
            }
            if ( val.isEmpty ) {
              if ( homeController.addressType.value == true ) {
                homeController.addressType.value = false;
              }
            }
          },
        ),),
        SizedBox(height: 10.h,),
        Obx(() => CustomTextField(
          controller: homeController.postalCodeController,
          hintText: AppStrings.postalCode,
          labelPadding: homeController.isPostalCode.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
          isType: homeController.postalCodeType.value,
          onchange: (val){
            if(val.isNotEmpty) {
              homeController.isPostalCode.value = true;
              homeController.postalCodeType.value = true;
              if ( homeController.addressController.value.text.isEmpty ) {
                homeController.isAddress.value = false;
                homeController.addressType.value = false;
              }
              if ( homeController.suiteController.value.text.isEmpty ) {
                homeController.isSuite.value = false;
                homeController.suiteType.value = false;
              }
            }
            if ( val.isEmpty ) {
              if ( homeController.postalCodeType.value == true ) {
                homeController.postalCodeType.value = false;
              }
            }
          },
        ),),
        SizedBox(height: 10.h,),
        Obx(() => CustomTextField(
          controller: homeController.suiteController,
          hintText: "${AppStrings.suite}(${AppStrings.optional})",
          labelPadding: homeController.isSuite.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
          isType: homeController.suiteType.value,
          onchange: (val){
            if(val.isNotEmpty) {
              homeController.isSuite.value = true;
              homeController.suiteType.value = true;
              if ( homeController.postalCodeController.value.text.isEmpty ) {
                homeController.isPostalCode.value = false;
                homeController.postalCodeType.value = false;
              }
              if ( homeController.addressController.value.text.isEmpty ) {
                homeController.isAddress.value = false;
                homeController.addressType.value = false;
              }
            }
            if ( val.isEmpty ) {
              if ( homeController.suiteType.value == true ) {
                homeController.suiteType.value = false;
              }
            }
          },
        ),),
      ],
    );
  }

  Widget selectWidget({
    required String image,
    required String title,
    required VoidCallback onTap,
    required BoxBorder border
  }) {
    return Center(
      child: GestureDetector(
        onTap: (){
          homeController.isSelect.value = true;
          if (homeController.count.value == 1 ) {
            homeController.count.value++;
          }
          onTap();
        },
        child: Container(
          height: 50.h,
          width: 320.w,
          decoration: BoxDecoration(
              color: AppColors.lightGray.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
            border: border
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

  Widget bottomSheetWidget({
    required String title,
    required String subTitle,
    required VoidCallback onTap,
    required Widget desc,
    required Color color}) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Container(
            color: color,
            height: 65.h,
            width: Get.width,
            child: Center(
                child: CustomText(
                    text: title,
                  fontSize: 28.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: subTitle,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(height: 20.h,),
                      desc,
                      SizedBox(height: 20.h,),
                      Center(
                        child: CustomButton(
                          height: 43.h,
                            width: 180.w,
                            onTap: (){
                              homeController.isAgree.value = true;
                              if( homeController.count.value == 2 ) {
                                homeController.count.value++;
                              }
                              Get.back();
                            },
                            buttonText: AppStrings.agree,
                          isHome: true,
                          fontSize: 16.sp,
                          backgroundColor: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 30.h,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ownerPact() {
    return Column(
      children: [
        CustomText(
            text: AppStrings.oPactDesc1,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.oPactDesc2,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.oPactDesc3,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.oPactDesc4,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.oPactDesc5,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ],
    );
  }

  Widget borrowerPact() {
    return Column(
      children: [
        CustomText(
          text: AppStrings.bPactDesc1,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.bPactDesc2,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.bPactDesc3,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.bPactDesc4,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.bPactDesc5,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        SizedBox(height: 12.h,),
        CustomText(
          text: AppStrings.bPactDesc6,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
