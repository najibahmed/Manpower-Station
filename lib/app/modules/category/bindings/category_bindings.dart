import 'package:get/get.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/home/service_repo/service_repository.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
          () => CategoryController(serviceRepository: Get.find<ServiceRepository>()),
    );
  }
}