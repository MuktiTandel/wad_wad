import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_dialog.dart';
import 'package:wad_wad/core/routes/app_pages.dart';

class HomeController extends GetxController {

  RxInt count = 1.obs;
  RxBool isSelect = false.obs;

  RxBool isDogOwner = false.obs;
  RxBool isDogBorrower = false.obs;

  RxBool isAgree = false.obs;

  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();

  RxBool addressType = false.obs;
  RxBool postalCodeType = false.obs;
  RxBool suiteType = false.obs;

  RxBool isAddress = false.obs;
  RxBool isPostalCode = false.obs;
  RxBool isSuite = false.obs;

  void validation() {

    if ( addressController.value.text.isEmpty) {
      ShowDialog(Get.context!, AppStrings.pEAddress, AppStrings.ok);
    } else if ( postalCodeController.value.text.isEmpty ) {
      ShowDialog(Get.context!, AppStrings.pEPostalCode, AppStrings.ok);
    } else {
      if ( isDogOwner.value == true ) {
        Get.toNamed(AppPages.ADDDOGPROFILE);
      } else {
        Get.toNamed(AppPages.ADDYOURPROFILE);
      }
    }

  }

}