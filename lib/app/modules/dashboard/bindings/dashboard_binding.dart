import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import 'package:manpower_station/app/modules/home/controllers/home_controller.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/user_profile/user_controller/user_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
          () => DashBoardController(),fenix: true
    );
    Get.lazyPut<OrderController>(
          () => OrderController(),fenix: true
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<AuthenticationController>(
          () => AuthenticationController(),
    );Get.lazyPut<HelpController>(
          () => HelpController(),
    );Get.lazyPut<MenusController>(
          () => MenusController(),
    );Get.lazyPut<ServiceController>(
          () => ServiceController(),fenix: true
    );Get.lazyPut<UserController>(
          () => UserController(),fenix: true
    );
  }
}