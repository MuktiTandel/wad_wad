import 'package:get/get.dart';
import 'package:wad_wad/features/onboard/controller/onboard_controller.dart';

class OnboardBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(() => OnboardController());
  }

}