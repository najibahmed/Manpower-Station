import 'package:get/get.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/app/modules/checkOut/respository/checkout_repo.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
          () => CheckoutController(checkOutRepo: Get.find<CheckoutRepo>()),
    );
  }
}