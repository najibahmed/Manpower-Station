import 'package:aamarpay/aamarpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';

import '../../../routes/app_pages.dart';


class MyPay extends GetView<CheckoutController> {
  const MyPay({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              Get.offNamedUntil(AppPages.DashboardView,(Route<dynamic> route) => route.isFirst);
            },
                icon: const Icon(Icons.home_outlined)),
            const SizedBox(
              height: 20,
            ),
            Container(
                color: Theme.of(context).cardColor,
                width: HelperFunction.instance.getScreenWidth(context) * 1,
                height: HelperFunction.instance.getScreenHeight(context) * 0.05,
                child: const Center(child: Text("Pay Advance "))),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "You have to pay advance 99 TK to confirm this service."),
            const SizedBox(
              height: 40,
            ),
      Aamarpay(
        // This will return a payment url based on failUrl,cancelUrl,successUrl
        returnUrl: (String url) {
          print('Return Url---->$url');
        },
        // This will return the payment loading status
        isLoading: (bool loading) {
          controller.isLoading.value = loading;

        },
        // This will return the payment event with a message
        status: (EventState event, String message) {
          if (event == EventState.backButtonPressed ||
              event == EventState.cancel ||
              event == EventState.error) {

            controller.isLoading.value= false;
            CustomSnackBar.showCustomErrorToast(message: message);
          }
          print('---->this is the payment event message $message');
          if (event == EventState.fail) {
            controller.isLoading.value = false;
            CustomSnackBar.showCustomErrorToast(message: message);
          }
          if (event == EventState.success) {
            controller.isLoading.value = false;
            // Get.offNamedUntil(AppPages.DashboardView,(Route<dynamic> route) => false);
            CustomSnackBar.showCustomSnackBar(title: "Order Confirmed", message: message);
          }
        },

        // When you use your own url, you must have the
        // keywords:cancel,confirm,fail otherwise the callback function will not work properly

        cancelUrl: "example.com/payment/cancel",
        successUrl: "example.com/payment/confirm",
        failUrl: "manpower/demo/fail",
        customerEmail: "demo@gmail.com",
        customerMobile: "${controller.phoneNumberController.text.trim()}",
        customerName: "${controller.nameController.text.trim()}",
        customerAddress1: "${controller.addressLine1Controller.text.trim()}",
        customerCity: "${controller.cityController.text.trim()}",
        customerState: "${controller.stateController.text.trim()}",
        // That is the test signature key. But when you go to the production you must use your own signature key
        signature: "dbb74894e82415a2f7ff0ec3a97e4183",
        // That is the test storeID. But when you go to the production you must use your own storeID
        storeID: "aamarpaytest",
        // Use transactionAmountFromTextField when you pass amount with TextEditingController
        // transactionAmountFromTextField: amountTextEditingController,
        transactionAmount: "99",
        //The transactionID must be unique for every payment
        transactionID: "${DateTime.now().millisecondsSinceEpoch}",
        //The transactionID must be unique for every payment
        /// transactionID: "transactionID",
        description: "test",
        // When the application goes to the production the isSandbox must be false
        isSandBox: true,
        child:  controller.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange,
          ),
          height: 50,
          child: const Center(
            child: Text(
              "Payment",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),

      ),
          ],
        ),
      ),
    );
  }
}


