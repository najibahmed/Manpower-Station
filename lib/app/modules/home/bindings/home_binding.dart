import 'package:get/get.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';
import 'package:manpower_station/app/network/api_service.dart';
import '../controllers/home_controller.dart';
import '../service_repo/service_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(repository:Get.find<ServiceRepository>()),
    );Get.lazyPut<CategoryController>(
      () => CategoryController(serviceRepository: Get.find<ServiceRepository>()),
    );Get.lazyPut<BookingsController>(
      () => BookingsController(apiService: Get.find<ApiServices>()),
    );Get.lazyPut<SearchViewController>(
      () => SearchViewController(repository:Get.find<ServiceRepository>()),
    );
  }
}
