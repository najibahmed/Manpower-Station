import 'package:get/get.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );Get.lazyPut<OrderController>(
      () => OrderController(),
    );Get.lazyPut<SearchViewController>(
      () => SearchViewController(),
    );
  }
}
