import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_dialog.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/core/utils/validation.dart';

class LoginController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isEmail = false.obs;
  RxBool isPassword = false.obs;
  RxBool isObscure = false.obs;

  RxBool emailType = false.obs;
  RxBool passwordType = false.obs;


  void validation() {
    if ( emailController.value.text.isEmpty) {
      ShowDialog(Get.context!, AppStrings.pEEmail, AppStrings.ok);
    }  else if ( !emailController.value.text.isValidEmail ) {
      ShowDialog(Get.context!, AppStrings.vEmail, AppStrings.ok);
    }else if ( passwordController.value.text.isEmpty ) {
      ShowDialog(Get.context!, AppStrings.pEPassword, AppStrings.ok);
    } else if ( passwordController.value.text.length < 6 ) {
      ShowDialog(Get.context!, AppStrings.vPassword, AppStrings.ok);
    } else {
      Get.toNamed(AppPages.HOME);
    }
  }

}