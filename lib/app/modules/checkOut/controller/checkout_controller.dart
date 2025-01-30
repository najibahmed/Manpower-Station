import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/checkOut/respository/checkout_repo.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/network/api_list.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:uuid/uuid.dart';
import '../../../../utils/helper_function.dart';
import '../../../components/custom_snackbar.dart';
import '../views/checkout_screen.dart';

class CheckoutController extends BaseController {
  final CheckoutRepo checkOutRepo;

  CheckoutController({required this.checkOutRepo});

  final serviceController = Get.find<ServiceController>();
  RxBool isLoading = RxBool(false);
  RxString paymentMethodGroupValue = PaymentMethod.cod.obs;
  RxString _transactionId=''.obs;
  String get transactionId =>_transactionId.value;
  final formKey = GlobalKey<FormState>();
  final List<WorkerModel> worker =
      Get.find<WorkerController>().selectedWorkerList;
  final List<CartModel> cartItem = Get.find<ServiceController>().getCartItems;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();


  /// Save order or create bookings & payment
  Future<void> saveOrder() async {
    if (formKey.currentState!.validate()) {
      if (await HelperFunction.instance.isInternetConnected()) {
          var amount = 99;
          // var transId = const Uuid();
          Map<String, dynamic> requestData = {
            'amount': amount,
            'workersItems': [worker.first.toJson()],
            'cartItems': [cartItem.first.toMap()],
            'addressInfo': {
              'name': nameController.text.trim(),
              'phone': phoneNumberController.text.trim(),
              'area': areaController.text.trim(),
              'state': stateController.text.trim(),
              'city': cityController.text.trim(),
              'address': addressLine1Controller.text.trim(),
            },
            'app': 'ammerpay-app'
          };
          var response = await checkOutRepo.postData(
              requestData, ApiList.userOrderCreateUrl);
          print("1. ammarpay response:${response.statusCode}");
          if (response.statusCode == 200) {
            var tranId=response.data['formData']["tran_id"];
            print("2. Transaction Id:$tranId");
            if(tranId !=null){
            _transactionId.value=response.data['formData']["tran_id"];
            Get.toNamed(AppPages.PaymentScreen);
            }
          } else {
            CustomSnackBar.showCustomErrorSnackBar(
                title: 'Failed to Place Order',
                message: '${response.statusMessage}');
          }

      } else {
        CustomSnackBar.showCustomErrorToast(
            title: "No Internet!!",
            message: "Please check internet connection.");
      }
    }
  }


/// Booking payment success
  Future<void> setPaymentSuccess()async{
      const appStatus= 'ammerpay-app';
    var response = await checkOutRepo.postWithOutData(ApiList.getPaymentSuccessUrl(_transactionId.value, appStatus));

      if(response.statusCode==200){

      }else{

      }

  }
/// Booking payment cancel/fail
  Future<void> setPaymentCancel()async{
      const appStatus= 'ammerpay-app';
    var response = await checkOutRepo.postWithOutData(ApiList.getPaymentFailsUrl(_transactionId.value, appStatus));
      print("Fail response:${response.statusCode}");
      // CustomSnackBar.showCustomErrorToast(message: response.data["message"]);

  }


  /// calculated discount amount on behalf of  price and percentage
  num getDiscountAmount(discount, num price) {
    if (discount.discountType == "Percentage Discount") {
      return ((price * discount.discount!) / 100).round();
    } else {
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
            getDiscountAmount(cartItem.first.discountModel,
                serviceController.cartSubtotal.value))
        .round());
  }

  @override
  void onInit() {
    super.onInit();
  }
 void clearControllers(){
   nameController.dispose();
   phoneNumberController.dispose();
   addressLine1Controller.dispose();
   cityController.dispose();
   stateController.dispose();
   areaController.dispose();
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
