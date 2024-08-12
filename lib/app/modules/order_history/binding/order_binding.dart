import 'package:get/get.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
          () => OrderController(),
    );
  }
}