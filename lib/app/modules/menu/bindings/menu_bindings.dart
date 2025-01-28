import 'package:get/get.dart';
import 'package:manpower_station/app/modules/home/controllers/home_controller.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';

import '../../home/service_repo/service_repository.dart';


class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenusController>(() => MenusController());
    Get.lazyPut<HomeController>(() => HomeController(repository:Get.find<ServiceRepository>()));
    // Get.lazyPut<UserController>(() => UserController(),fenix: true);
  }
}