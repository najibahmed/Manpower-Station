import 'package:get/get.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(
          () => ServiceController(),
    );
  }
}