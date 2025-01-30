import 'package:get/get.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/modules/checkOut/respository/checkout_repo.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import 'package:manpower_station/app/modules/home/controllers/home_controller.dart';
import 'package:manpower_station/app/modules/home/service_repo/service_repository.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/user_profile/user_repo/user_repository.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/network/api_service.dart';

import '../../user_profile/user_profile_controller/user_profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    /// Repository
    Get.lazyPut<ServiceRepository>(
      () => ServiceRepository(),
    );
    Get.lazyPut<ApiServices>(
      () => ApiServices(),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepository(),
    );
    Get.lazyPut<CheckoutRepo>(
      () => CheckoutRepo(),
    );

    /// Controller
    Get.put<DashBoardController>(
      DashBoardController(),
    );
    Get.lazyPut<BookingsController>(
      () => BookingsController(apiService: Get.find<ApiServices>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(repository:Get.find<ServiceRepository>()),
    );
    Get.lazyPut<UserController>(
      () => UserController(userRepository:Get.find<UserRepository>()),
    );
    Get.lazyPut<MenusController>(
      () => MenusController(),
    );
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
    Get.lazyPut<WorkerController>(
      () => WorkerController(),
    );
    Get.lazyPut<SearchViewController>(
      () => SearchViewController(repository:Get.find<ServiceRepository>()),
    );
    Get.lazyPut<HelpController>(
      () => HelpController(apiService: Get.find<ApiServices>()),
    );
  }
}
