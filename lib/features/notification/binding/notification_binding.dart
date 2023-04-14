import 'package:get/get.dart';
import 'package:wad_wad/features/notification/controller/notification_controller.dart';

class NotificationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }


}