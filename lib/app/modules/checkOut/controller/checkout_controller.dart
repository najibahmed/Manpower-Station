import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/services/api_client.dart';

import '../views/checkout_screen.dart';

class CheckoutController extends BaseController {
  final serviceController = Get.put(ServiceController());
  RxString paymentMethodGroupValue = PaymentMethod.cod.obs;
  RxList cartItems=[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  Future<void> createBookings() async {
    try {
      var url = "http://172.16.154.43/api/payments/ammerpay/create";
      Map<String, dynamic> requestData = {
        'amount': int,
        'worker': ["WokerModel"],
        'cartItems': [],
        'addressInfo': {
          "name": "",
          "phone": "",
          "address": "",
          "area": "",
          "state": "",
          "city": "",
        },
      };
      await BaseClient.safeApiCall(url, RequestType.post, data: requestData,
          onSuccess: (response) {
        // if (kDebugMode) {
        //   print(response.data);
        // }
        if (response.statusCode == 200) {
        } else {
          print('Failed to load Categories: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print(e);
    }
  }

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
