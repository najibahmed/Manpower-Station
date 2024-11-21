import 'package:aamarpay/aamarpay.dart';
import 'package:flutter/material.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';

class MyPay extends StatefulWidget {
  const MyPay({super.key});

  @override
  _MyPayState createState() => _MyPayState();
}

class _MyPayState extends State<MyPay> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Theme.of(context).cardColor,
                width:HelperFunction.instance.getScreenWidth(context)*1,
                height:HelperFunction.instance.getScreenHeight(context)*0.05,
                child: const Center(child: Text("Pay Advance "))),
            const SizedBox(
              height: 20,
            ),
            const Text("You have to pay advance 99${Constants.banglaCurrency} to confirm this service."),
            const SizedBox(
              height: 40,
            ),
            Aamarpay(
              // This will return a payment url based on failUrl,cancelUrl,successUrl
              returnUrl: (String url) {
                print('---->$url');
              },
              // This will return the payment loading status
              isLoading: (bool loading) {
                setState(() {
                  isLoading = loading;
                });
              },
              // This will return the payment event with a message
              status: (EventState event, String message) {
                if (event == EventState.backButtonPressed ||
                    event == EventState.cancel ||
                    event == EventState.error) {
                  setState(() {
                    isLoading = false;
                  });
                  CustomSnackBar.showCustomErrorToast(message: message);
                }
                print('---->this is the payment event message $message');
                if (event == EventState.fail) {
                  setState(() {
                    isLoading = false;
                  });
                  CustomSnackBar.showCustomErrorToast(message: message);
                }
                if (event == EventState.success) {
                  setState(() {
                    isLoading = false;
                  });
                  CustomSnackBar.showCustomToast(message: message);
                }
              },

              // When you use your own url, you must have the keywords:cancel,confirm,fail otherwise the callback function will not work properly
              cancelUrl: "example.com/payment/cancel",
              successUrl: "example.com/payment/confirm",
              failUrl: "manpower/najib/fail",
              customerEmail: "masumbillahsanjid@gmail.com",
              customerMobile: "01834760591",
              customerName: "Najib Ahmed",
              // That is the test signature key. But when you go to the production you must use your own signature key
              signature: "dbb74894e82415a2f7ff0ec3a97e4183",
              // That is the test storeID. But when you go to the production you must use your own storeID
              storeID: "aamarpaytest",
              // Use transactionAmountFromTextField when you pass amount with TextEditingController
              // transactionAmountFromTextField: amountTextEditingController,
              transactionAmount: "200",
              //The transactionID must be unique for every payment
              transactionID: "${DateTime.now().millisecondsSinceEpoch}",
              //The transactionID must be unique for every payment
              /// transactionID: "transactionID",
              description: "test",
              // When the application goes to the production the isSandbox must be false
              isSandBox: true,
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      color: Colors.orange,
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
