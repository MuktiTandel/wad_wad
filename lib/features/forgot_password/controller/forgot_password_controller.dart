import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

  final TextEditingController emailController = TextEditingController();

  RxBool isEmail = false.obs;
  RxBool emailType = false.obs;

}