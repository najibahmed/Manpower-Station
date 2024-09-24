import 'package:get/get.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );
  }
}