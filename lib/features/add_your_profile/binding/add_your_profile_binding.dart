import 'package:get/get.dart';
import 'package:wad_wad/features/add_your_profile/controller/add_your_profile_controller.dart';

class AddYourProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AddYourProfileController>(() => AddYourProfileController());
  }

}