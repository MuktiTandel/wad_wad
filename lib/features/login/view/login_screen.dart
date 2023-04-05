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
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/features/login/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
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
              SizedBox(height: 50.h,),
              Obx(() => CustomTextField(
                controller: loginController.emailController,
                hintText: AppStrings.eMail,
                labelPadding: loginController.isEmail.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                isType: loginController.emailType.value,
                onchange: (val){
                  if(val.isNotEmpty) {
                    loginController.isEmail.value = true;
                    loginController.emailType.value = true;
                    if ( loginController.passwordController.value.text.isEmpty ) {
                      loginController.isPassword.value = false;
                      loginController.passwordType.value = false;
                    }
                  }
                  if ( val.isEmpty ) {
                    if ( loginController.emailType.value == true ) {
                      loginController.emailType.value = false;
                    }
                  }
                },
              ),),
              SizedBox(
                height: 18.h,
              ),
              Obx(() => CustomTextField(
                controller: loginController.passwordController,
                hintText: AppStrings.password,
                maxLine: 1,
                isObscure: !loginController.isObscure.value,
                suffixWidget: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: GestureDetector(
                    onTap: (){
                      if ( loginController.isObscure.value == false ) {
                        loginController.isObscure.value = true;
                      } else {
                        loginController.isObscure.value = false;
                      }
                    },
                    child: Image.asset(
                      loginController.isObscure.value == false ? AppImages.private : AppImages.visibility,
                      height: 5.h,
                      color: Colors.grey,
                    ),
                  ),
                ),
                labelPadding: loginController.isPassword.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                isType: loginController.passwordType.value,
                onchange: (val){
                  if(val.isNotEmpty) {
                    loginController.isPassword.value = true;
                    loginController.passwordType.value = true;
                    if ( loginController.emailController.value.text.isEmpty ) {
                      loginController.isEmail.value = false;
                      loginController.emailType.value = false;
                    }
                  }
                  if (val.isEmpty) {
                    if ( loginController.passwordType.value == true ) {
                      loginController.passwordType.value = false;
                    }
                  }
                },
              ),),
              SizedBox(height: 15.h,),
              CustomButton(
                onTap: (){
                  Get.offNamed(AppPages.HOME);
                },
                buttonText: AppStrings.login,
                height: 45.h,
                borderRadius: 13,
              ),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: AppStrings.fyPassword,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGray1,
                  ),
                  CustomText(
                      text: " ${AppStrings.cHere}",
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightOrange1,
                  )
                ],
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
                      Get.toNamed(AppPages.SIGNUP);
                    },
                    child: CustomText(
                      text: ' ${AppStrings.signUp}',
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
    );
  }
}
