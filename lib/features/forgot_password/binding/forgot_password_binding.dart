import 'package:get/get.dart';
import 'package:wad_wad/features/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }

}