import 'package:get/get.dart';
import 'package:wad_wad/features/sign_up/controller/signup_controller.dart';

class SignupBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }

}