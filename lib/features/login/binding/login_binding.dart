import 'package:get/get.dart';
import 'package:wad_wad/features/login/controller/login_controller.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }


}