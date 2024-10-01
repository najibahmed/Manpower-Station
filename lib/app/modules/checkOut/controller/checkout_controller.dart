import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:uuid/uuid.dart';

import '../views/checkout_screen.dart';

class CheckoutController extends BaseController {
  final serviceController = Get.put(ServiceController());
  RxString paymentMethodGroupValue = PaymentMethod.cod.obs;
  final formKey = GlobalKey<FormState>();
  final worker=Get.put(WorkerController()).selectedWorkerList;
  final List<CartModel> cartItem=Get.put(ServiceController()).cartItems;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();


 /// Save order or create bookings & payment
  Future<void> saveOrder() async{
    // if (nameController.text.isEmpty) {
    //   CustomSnackBar.showCustomToast(message:  'Please provide your address');
    //   return;
    // }
    // if (addressLine1Controller.text.isEmpty) {
    //   CustomSnackBar.showCustomToast(message:  'Please provide your zip code');
    //   return;
    // }
    // if (cityController.text.isEmpty) {
    //   CustomSnackBar.showCustomToast(message:  'Please type your city');
    //   return;
    // }if (phoneNumberController.text.isEmpty) {
    //   CustomSnackBar.showCustomToast(message:  'Please enter your phone number');
    //   return;
    // }
    if(formKey.currentState!.validate()){
      try {
        var amount=99;
        var transId =const Uuid();
        Map<String, dynamic> requestData = {
          'amount': amount,
          'workersItems': [worker.first.toJson()],
          'cartItems': cartItem,
          'addressInfo': {
            'name':  nameController.text.trim(),
            'phone': phoneNumberController.text.trim(),
            'area':  areaController.text.trim(),
            'state': stateController.text.trim(),
            'city':  cityController.text.trim(),
            'address': addressLine1Controller.text.trim(),
          },
        };
        var url="/api/payments/ammerpay/create";
        // await BaseClient.safeApiCall(
        //     url,
        //     RequestType.post,
        //     data: requestData,
        //     onSuccess: (response) {
        //       // if (kDebugMode) {
        //       //   print(response.data);
        //       // }
        //       if (response.statusCode == 200) {
        //
        //       } else {
        //         print('Failed to Book Service: ${response.statusMessage}');
        //       }
        //     }
        // );

      } catch (error) {
        rethrow;
      }
    }

  }
  /// calculated discount amount on behalf of  price and percentage
  int getDiscountAmount(num discount,num price) {
    return ((price * discount) / 100).round();
  }
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

  @override
  void onClose() {
     nameController.dispose();
     phoneNumberController.dispose();
     addressLine1Controller.dispose();
     cityController.dispose();
     stateController.dispose();
     areaController.dispose();
    super.onClose();
  }
}
