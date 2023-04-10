import 'package:get/get.dart';
import 'package:wad_wad/features/add_dog_owner_profile/controller/add_dog_owner_profile_controller.dart';

class AddDogOwnerProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AddDogOwnerProfileController>(() => AddDogOwnerProfileController());
  }

}