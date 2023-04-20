import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/scroll_behavior.dart';
import 'package:wad_wad/core/routes/app_pages.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  ScrollController scrollController = ScrollController();

  double offset = 0.0 ;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()..addListener(() {
      setState(() {
        offset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: AppBehavior(),
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 13.w, right: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.settings,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h,),
                  Center(
                    child: CircleAvatar(
                      maxRadius: 55.h,
                      // networkImage
                      backgroundImage: const AssetImage(AppImages.dog6),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Center(
                    child: CustomText(
                        text: 'User name',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            AppImages.location,
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 5.w,),
                        CustomText(
                            text: 'Surat',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  commonWidget(
                      onTap: (){},
                      image: AppImages.edit,
                      title: AppStrings.eProfile,
                      desc: AppStrings.desc
                  ),
                  SizedBox(height: 10.h,),
                  commonWidget(
                      onTap: (){},
                      image: AppImages.faq,
                      title: AppStrings.faq,
                      desc: AppStrings.desc
                  ),
                  SizedBox(height: 10.h,),
                  commonWidget(
                      onTap: (){},
                      image: AppImages.contact,
                      title: AppStrings.contactUs,
                      desc: AppStrings.desc
                  ),
                  SizedBox(height: 50.h,),
                  SizedBox(
                    height: 50.h,
                      child: ElevatedButton(
                          onPressed: (){
                            Get.offAllNamed(AppPages.LOGIN);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: AppStrings.signOut,
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 10.w,),
                              Image.asset(
                                  AppImages.signOut,
                                height: 18.h,
                                width: 18.w,
                              )
                            ],
                          ))
                  ),
                  SizedBox(height: 50.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget commonWidget({
    required VoidCallback onTap,
    required String image,
    required String title,
    required String desc}) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          elevation: 5,
          shadowColor: AppColors.gray.withOpacity(0.2),
          child: Container(
            width: Get.width,
            height: 55.h,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 13.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(width: 10.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                    CustomText(
                      text: desc,
                      fontSize: 10.sp,
                      color: AppColors.gray,
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
