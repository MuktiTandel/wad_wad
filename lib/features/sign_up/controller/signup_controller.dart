import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_dialog.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/core/utils/validation.dart';

class SignUpController extends GetxController {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isName = false.obs;
  RxBool isEmail = false.obs;
  RxBool isPassword = false.obs;

  RxBool nameType = false.obs;
  RxBool emailType = false.obs;
  RxBool passwordType = false.obs;

  RxBool isObscure = false.obs;

  void validation() {
    if ( nameController.value.text.isEmpty) {
      ShowDialog(Get.context!, AppStrings.pEName, AppStrings.ok);
    } else if ( emailController.value.text.isEmpty) {
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