import 'package:get/get.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import 'package:manpower_station/app/modules/home/controllers/home_controller.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(
           DashBoardController(),
    );
    Get.lazyPut<OrderController>(
          () => OrderController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<HelpController>(
          () => HelpController(),
    );Get.lazyPut<MenusController>(
          () => MenusController(),
    );Get.lazyPut<ServiceController>(
          () => ServiceController(),
    );Get.lazyPut<WorkerController>(
          () => WorkerController(),
    );Get.lazyPut<SearchViewController>(
          () => SearchViewController(),
    );
    // Get.lazyPut<UserController>(
    //       () => UserController(),
    // );
  }
}