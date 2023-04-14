import 'package:get/get.dart';
import 'package:wad_wad/features/dashboared/controller/dashboared_controller.dart';

class DashBoredBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyReplace<DashBoredController>(() => DashBoredController());
  }

}