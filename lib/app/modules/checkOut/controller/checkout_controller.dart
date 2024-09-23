import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';

import '../views/checkout_screen.dart';

class CheckoutController extends BaseController {
 final serviceController=Get.put(ServiceController());
  RxString paymentMethodGroupValue = PaymentMethod.cod.obs;


  TextEditingController nameController =TextEditingController();
  TextEditingController phoneNumberController =TextEditingController();
  TextEditingController addressLine1Controller =TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController stateController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController zipCodeController =TextEditingController();





  // int getDiscountAmount(num cartSubTotal) {
  //   return ((cartSubTotal * orderConstantModel.discount) / 100).round();
  // }
  //
  // int getVatAmount(num cartSubTotal) {
  //   final priceAfterDiscount = cartSubTotal - getDiscountAmount(cartSubTotal);
  //   return ((priceAfterDiscount * orderConstantModel.vat) / 100).round();
  // }
  // int getGrandTotal(num cartSubTotal) {
  //   return ((cartSubTotal -
  //       getDiscountAmount(cartSubTotal) +
  //       getVatAmount(cartSubTotal) +
  //       orderConstantModel.deliveryCharge))
  //       .round();
  // }
  @override
  void onInit() {
    super.onInit();
  }
}
