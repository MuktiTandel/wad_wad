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
import 'package:wad_wad/core/elements/scroll_behavior.dart';
import 'package:wad_wad/features/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);

   final forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding:  EdgeInsets.all(12.w),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Image.asset(
                AppImages.arrowLeftCopy,
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: AppBehavior(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height - 72.h,
            ),
            child: Padding(
              padding:  EdgeInsets.all(18.w),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h,),
                    CustomText(
                        text: AppStrings.forgotPassword,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 80.h,),
                    Obx(() => CustomTextField(
                      controller: forgotPasswordController.emailController,
                      hintText: AppStrings.yourEmail,
                      labelPadding: forgotPasswordController.isEmail.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                      isType: forgotPasswordController.emailType.value,
                      onchange: (val){
                        if ( val.isNotEmpty )  {
                          forgotPasswordController.isEmail.value = true;
                          forgotPasswordController.emailType.value = true;
                        }
                        if ( val.isEmpty ) {
                          if ( forgotPasswordController.emailType.value == true ) {
                            forgotPasswordController.emailType.value = false;
                          }
                        }
                      },
                    )),
                    SizedBox(height: 10.h,),
                    const CustomText(
                        text: AppStrings.resetPassword,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                    Expanded(child: SizedBox(height: 10.h,)),
                    Padding(
                      padding:  EdgeInsets.only(left: 13.w, right: 13.w),
                      child: CustomButton(
                        height: 50.h,
                          onTap: (){}, buttonText: AppStrings.next,
                        isHome: true,
                        isSelect: true,
                      ),
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
