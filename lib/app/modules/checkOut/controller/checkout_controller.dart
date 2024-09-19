import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

import '../views/checkout_screen.dart';

class CheckoutController extends BaseController {

  RxString paymentMethodGroupValue = PaymentMethod.cod.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
