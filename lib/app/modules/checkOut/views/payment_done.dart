
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/utils/app_Images.dart';

class PaymentDone extends GetView<CheckoutController> {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppImages.instance.paymentDone,
                color: Colors.green,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: Theme.of(context).textTheme.displayLarge!.color,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
             Text(
              "Payment Done Successfully",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              controller.cartItem.first.serviceName,
              style: TextStyle(
                color: Theme.of(context).textTheme.displayLarge!.color,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),Text(
              "Order Confirmed",
              style: TextStyle(
                color: Theme.of(context).textTheme.displayLarge!.color,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            // Text(
            //   "You will be redirected to the home page shortly\nor click here to return to home page",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.black54,
            //     fontWeight: FontWeight.w400,
            //     fontSize: 14,
            //   ),
            // ),
            // SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: CustomButton(
                title: 'Home',
                onTap: () {
                  Get.find<BookingsController>().getAllBookingsByUid();
                  Get.offNamedUntil(AppPages.DashboardView, (route)=>route.isFirst);
                }, height: 60, width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}