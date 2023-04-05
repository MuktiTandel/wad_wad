import 'package:get/get.dart';
import 'package:wad_wad/features/add_dog_profile/controller/add_dog_profile_controller.dart';

class AddDogProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AddDogProfileController>(() => AddDogProfileController());
  }

}