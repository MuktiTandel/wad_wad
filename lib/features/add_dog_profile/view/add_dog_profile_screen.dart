import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/custom_textfield.dart';
import 'package:wad_wad/features/add_dog_profile/controller/add_dog_profile_controller.dart';

class AddDogProfileScreen extends StatelessWidget {
   AddDogProfileScreen({Key? key}) : super(key: key);

   final addDogProfileController = Get.put(AddDogProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        leading: Padding(
          padding:  EdgeInsets.all(12.w),
          child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child:
              Image.asset(
                AppImages.arrowLeft,
              )
          ),
        ),
        title: CustomText(
            text: AppStrings.aDProfile,
          color: Colors.black,
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                addDogProfileController.pickImage();
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
                                      text: AppStrings.uImage,
                                    fontSize: 13.sp,
                                    color: AppColors.gray1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Center(
                                  child: CustomText(
                                      text: AppStrings.dIHere,
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
            SizedBox(height: 25.h,),
            CustomTextField(
                controller: addDogProfileController.dogNameController,
              hintText: AppStrings.eYDName,
              onchange: (val){},
            ),
            SizedBox(height: 10.h,),
            Divider(
              height: 1.h,
              color: AppColors.gray.withOpacity(0.6),
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
