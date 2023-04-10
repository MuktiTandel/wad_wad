import 'package:get/get.dart';
import 'package:wad_wad/features/add_dog_walker_profile/controller/add_dog_walker_profile_controller.dart';

class AddDogWalkerProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AddDogWalkerProfileController>(() => AddDogWalkerProfileController()
    );
  }

}