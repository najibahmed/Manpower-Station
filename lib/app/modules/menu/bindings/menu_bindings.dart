import 'package:get/get.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';


class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenusController>(() => MenusController());
    // Get.lazyPut<UserController>(() => UserController(),fenix: true);
  }
}