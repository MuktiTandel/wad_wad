import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/custom_textfield.dart';
import 'package:wad_wad/features/sign_up/controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

   final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding:  EdgeInsets.all(13.w),
          child: GestureDetector(
            onTap: (){},
            child:
            Image.asset(
                AppImages.arrowLeftCopy,
            )
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: AppStrings.startHere,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
                text: AppStrings.lsDesc,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 18.h,),
            CustomTextField(
                controller: signUpController.nameController,
              hintText: AppStrings.fullName,
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomTextField(
                controller: signUpController.emailController,
              hintText: AppStrings.eMail,
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomTextField(
                controller: signUpController.passwordController,
              hintText: AppStrings.password,
              suffixWidget: Padding(
                padding: EdgeInsets.all(12.w),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Image.asset(
                      AppImages.private,
                    height: 5.h,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            CustomButton(
                onTap: (){},
                buttonText: AppStrings.signUp,
              height: 45.h,
              borderRadius: 13,
            ),
            SizedBox(height: 8.h,),
            Center(
              child: CustomText(
                  text: AppStrings.or,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h,)
          ],
        ),
      ),
    );
  }
}
