import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

}