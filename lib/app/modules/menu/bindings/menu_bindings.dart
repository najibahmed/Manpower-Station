import 'package:get/get.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';
import 'package:manpower_station/app/modules/user_profile/user_controller/user_controller.dart';


class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenusController>(() => MenusController());
    Get.lazyPut<UserController>(() => UserController());
  }
}