import 'package:get/get.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
          () => CheckoutController(),
    );
  }
}