
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../../../../utils/constants.dart';
import '../../../components/custom_snackbar.dart';
import '../views/checkout_screen.dart';

class CheckoutController extends BaseController {
  final serviceController = Get.find<ServiceController>();
  RxString paymentMethodGroupValue = PaymentMethod.cod.obs;
  final formKey = GlobalKey<FormState>();
  final List<WorkerModel> worker=Get.find<WorkerController>().selectedWorkerList;
  final List<CartModel> cartItem=Get.find<ServiceController>().cartItems;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
   String cartFieldServiceId = '_id';
   String cartFieldServiceName = 'name';
   String cartFieldServiceImageUrl = 'image';
   String cartFieldServiceDiscountModel = 'service_discount';
   String cartFieldServicePrice = 'service_price';
   String cartFieldServiceTotalPrice = 'totalPrice';
   String cartFieldServiceStartingDate = 'startWork';
   String cartFieldServiceSchedule = 'timeSchedule';

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
          'cartItems': [
            cartItem.first.toMap()
          ],
          'addressInfo': {
            'name':  nameController.text.trim(),
            'phone': phoneNumberController.text.trim(),
            'area':  areaController.text.trim(),
            'state': stateController.text.trim(),
            'city':  cityController.text.trim(),
            'address': addressLine1Controller.text.trim(),
          },
        };
        // print("request data----->${requestData}");
        var url="/api/payments/ammerpay/create";
        await BaseClient.safeApiCall(
            url,
            RequestType.post,
            data: requestData,
            // headers: {
            //   'Content-Type': 'application/json',
            //   'Accept': 'application/json',
            //   'Authorization':  Constants.accessToken         //MySharedPref.getAccessToken()
            // },
            onSuccess: (response) async {
              if (kDebugMode) {
                print(response.data);
              }
              if (response.statusCode == 201) {
                  final String url=response.data['url'];
                  if (!await launchUrl(Uri.parse(url))) {
                    CustomSnackBar.showCustomErrorSnackBar(title:'Failed Payment',message: 'Could not launch $url');
              // throw Exception('Could not launch $_url');
              }
              } else {
                CustomSnackBar.showCustomErrorSnackBar(title:'Failed to Book Service:',message: '${response.statusMessage}');
              }
            }
        );

      } catch (error) {
        rethrow;
      }
    }

  }
  /// calculated discount amount on behalf of  price and percentage
  num getDiscountAmount(discount,num price) {
    if(discount.discountType=="Percentage Discount"){
    return ((price * discount.discount!) / 100).round();
    }else{
    return discount.discount!;
    }

  }
  //
  // int getVatAmount(num cartSubTotal) {
  //   final priceAfterDiscount = cartSubTotal - getDiscountAmount(cartSubTotal);
  //   return ((priceAfterDiscount * orderConstantModel.vat) / 100).round();
  // }
  int getGrandTotal() {
    return ((serviceController.cartSubtotal.value -
        getDiscountAmount(cartItem.first.discountModel,serviceController.cartSubtotal.value)
        ).round());
  }

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
