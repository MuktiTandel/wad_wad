import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isEmail = false.obs;
  RxBool isPassword = false.obs;
  RxBool isObscure = false.obs;

}