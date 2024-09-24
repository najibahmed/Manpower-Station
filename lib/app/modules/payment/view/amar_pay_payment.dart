import 'package:aamarpay/aamarpay.dart';
import 'package:flutter/material.dart';

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
        child: Aamarpay(
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
            if (event == EventState.error) {
              setState(() {
                isLoading = false;
              });
            }
          },
          // When you use your own url, you must have the keywords:cancel,confirm,fail otherwise the callback function will not work properly
          cancelUrl: "example.com/payment/cancel",
          successUrl: "example.com/payment/confirm",
          failUrl: "example.com/payment/fail",
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
          // When the application goes to the producation the isSandbox must be false
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
      ),
    );
  }
}


