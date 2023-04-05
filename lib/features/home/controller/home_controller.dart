import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

}