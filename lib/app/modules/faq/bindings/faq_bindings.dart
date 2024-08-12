import 'package:get/get.dart';
import 'package:manpower_station/app/modules/faq/controller/faq_controller.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(
          () => FaqController(),
    );
  }
}