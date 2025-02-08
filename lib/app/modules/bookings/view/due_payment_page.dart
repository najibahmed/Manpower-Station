import 'package:aamarpay/aamarpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/app_Images.dart';
import '../../../../utils/helper_function.dart';
import '../../../components/big_text.dart';
import '../../../components/custom_snackbar.dart';
import '../../../routes/app_pages.dart';

class PayDue extends GetView<BookingsController> {
  const PayDue({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.bookings=Get.arguments;

    final size=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    IconButton(
                        onPressed: () {
                          Get.offNamedUntil(AppPages.DashboardView,
                                  (Route<dynamic> route) => route.isFirst);
                        },
                        icon: const Icon(Icons.home_outlined)),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    color: Theme.of(context).focusColor,
                    width: HelperFunction.instance.getScreenWidth(context) * 1,
                    height:
                    HelperFunction.instance.getScreenHeight(context) * 0.05,
                    child:
                    Center(child: BigText(text: "Confirmation Service"))),
                Card(
                  color: Colors.blue.shade50,
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text:
                        'Pay Due ',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: BigText(
                              text: "${controller.bookings.value!.totalAmount!.round() - controller.bookings.value!.advanceAmount!.round()}",
                              size: 24,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          const TextSpan(
                            text: '  Tk',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size*.04,
                ),
                Container(
                  height: size*.25,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppImages.instance.onlinePayment,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size*.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text:
                            'To get confirmation of the selected service you have to pay online only ',
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: <InlineSpan>[
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: BigText(
                                  text: "${controller.bookings.value!.totalAmount!.round() - controller.bookings.value!.advanceAmount!.round()}",
                                  size: 24,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              const TextSpan(
                                text: '  Tk advance.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                amarPaymentButton(controller.bookings.value!),
                SizedBox(
                  height: size*.15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox amarPaymentButton(BookingsModel booking) {
    return SizedBox(
      height: 50,
      width: 300,
      child: Obx(()=>Aamarpay(
        // This will return a payment url based on failUrl,cancelUrl,successUrl
        returnUrl: (String url) {
        },
        // This will return the payment loading status
        isLoading: (bool loading) {
          controller.isLoading.value = loading;
        },
        // This will return the payment event with a message
        status: (EventState event, String message)async {
          print('---->this is the payment event message $message');
          if (event == EventState.success) {
            controller.isLoading.value = false;
            await controller.setPaymentSuccess();
            // CustomSnackBar.showCustomSnackBar(
            //     title: "Order Confirmed", message: message);
            Get.offNamed(AppPages.DashboardView);
            showSuccessDialog(title:  "Payment Successful",successMsg:"Your payment was processed successfully!");
          }
          else if (event == EventState.cancel) {
            print('---->Cancel State');
            controller.isLoading.value = false;
            await controller.setPaymentCancel();
            CustomSnackBar.showCustomErrorToast(message: message);
          }
          else if (event == EventState.fail||event == EventState.backButtonPressed) {
            print('---->Fail State');
            await controller.setPaymentCancel();
            controller.isLoading.value = false;
            CustomSnackBar.showCustomErrorToast(message: message);
          }else if(event == EventState.error){
            print('---->Error State');
            CustomSnackBar.showCustomErrorToast(message: message);
          }
        },

        // When you use your own url, you must have the
        // keywords:cancel,confirm,fail otherwise the callback function will not work properly

        cancelUrl: "example.com/payment/cancel",
        successUrl: "example.com/payment/confirm",
        failUrl: "manpower/demo/fail",
        customerEmail: "demo@gmail.com",
        customerMobile: booking.phone!,
        customerName: booking.username!,
        customerAddress1: booking.area!,
        customerCity: booking.city!,
        customerState: booking.state!,
        // That is the test signature key. But when you go to the production you must use your own signature key
        signature: "dbb74894e82415a2f7ff0ec3a97e4183",
        // That is the test storeID. But when you go to the production you must use your own storeID
        storeID: "aamarpaytest",
        // Use transactionAmountFromTextField when you pass amount with TextEditingController
        // transactionAmountFromTextField: amountTextEditingController,
        transactionAmount: "${booking.totalAmount!.round() - booking.advanceAmount!.round()}",
        //The transactionID must be unique for every payment
        transactionID: "${DateTime.now().millisecondsSinceEpoch}",
        //The transactionID must be unique for every payment
        /// transactionID: "transactionID",
        description: "test",
        // When the application goes to the production the isSandbox must be false
        isSandBox: true,
        child: controller.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LightThemeColors.primaryColor,
          ),
          height: 50,
          child: const Center(
            child: Text(
              "Pay Due",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
