import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/custom_textfield.dart';
import 'package:wad_wad/core/elements/facebook_button.dart';
import 'package:wad_wad/core/elements/google_button.dart';
import 'package:wad_wad/core/elements/scroll_behavior.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
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
            onTap: (){
              Get.back();
            },
            child:
            Image.asset(
                AppImages.arrowLeftCopy,
            )
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: AppBehavior(),
        child: SingleChildScrollView(
          child: Padding(
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
                  color: AppColors.gray,
                ),
                SizedBox(height: 18.h,),
                Obx(() => CustomTextField(
                  controller: signUpController.nameController,
                  hintText: AppStrings.fullName,
                  labelPadding: signUpController.isName.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                  isType: signUpController.nameType.value,
                  onchange: (val){
                    if(val.isNotEmpty) {
                      signUpController.isName.value = true;
                      signUpController.nameType.value = true;
                      if ( signUpController.emailController.value.text.isEmpty ) {
                        signUpController.isEmail.value = false;
                        signUpController.emailType.value = false;
                      }
                      if ( signUpController.passwordController.value.text.isEmpty ) {
                        signUpController.isPassword.value = false;
                        signUpController.passwordType.value = false;
                      }
                    }
                    if (val.isEmpty ) {
                      if ( signUpController.nameType.value == true) {
                        signUpController.nameType.value = false;
                      }
                    }
                  },
                ),),
                SizedBox(
                  height: 18.h,
                ),
                Obx(() => CustomTextField(
                  controller: signUpController.emailController,
                  hintText: AppStrings.eMail,
                  labelPadding: signUpController.isEmail.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                  isType: signUpController.emailType.value,
                  onchange: (val){
                    if ( val.isNotEmpty ) {
                      signUpController.isEmail.value = true;
                      signUpController.emailType.value = true;
                      if ( signUpController.nameController.value.text.isEmpty ) {
                        signUpController.isName.value = false;
                        signUpController.nameType.value = false;
                      }
                      if ( signUpController.passwordController.value.text.isEmpty ) {
                        signUpController.isPassword.value = false;
                        signUpController.passwordType.value = false;
                      }
                    }
                    if ( val.isEmpty ) {
                      if ( signUpController.emailType.value == true ) {
                        signUpController.emailType.value = false;
                      }
                    }
                  },
                ),),
                SizedBox(
                  height: 18.h,
                ),
                Obx(() => CustomTextField(
                  controller: signUpController.passwordController,
                  hintText: AppStrings.password,
                  maxLine: 1,
                  isObscure: !signUpController.isObscure.value,
                  suffixWidget: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: GestureDetector(
                      onTap: (){
                        if ( signUpController.isObscure.value == false ) {
                          signUpController.isObscure.value = true;
                        } else {
                          signUpController.isObscure.value = false;
                        }
                      },
                      child: Image.asset(
                        signUpController.isObscure.value == false ? AppImages.private : AppImages.visibility,
                        height: 5.h,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  labelPadding: signUpController.isPassword.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                  isType: signUpController.passwordType.value,
                  onchange: (val){
                    if(val.isNotEmpty) {
                      signUpController.isPassword.value = true;
                      signUpController.passwordType.value = true;
                      if ( signUpController.nameController.value.text.isEmpty ) {
                        signUpController.isName.value = false;
                        signUpController.nameType.value = false;
                      }
                      if ( signUpController.emailController.value.text.isEmpty ) {
                        signUpController.isEmail.value = false;
                        signUpController.emailType.value = false;
                      }
                    }
                    if ( val.isEmpty ) {
                      if ( signUpController.passwordType.value == true ) {
                        signUpController.passwordType.value = false;
                      }
                    }
                  },
                ),),
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
                SizedBox(height: 8.h,),
                FacebookButton(
                  onTap: (){},
                ),
                SizedBox(height: 10.h,),
                GoogleButton(
                  onTap: (){},
                ),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.tpDesc,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGray1,
                    ),
                    CustomText(
                        text: ' ${AppStrings.termsOfUse}',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppStrings.and,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGray1,
                    ),
                    CustomText(
                      text: ' ${AppStrings.pPolicy}',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.jCommunity,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.offNamed(AppPages.LOGIN);
                      },
                      child: CustomText(
                          text: ' ${AppStrings.login}',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightOrange1,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
