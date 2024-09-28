import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/app/modules/checkOut/views/shipping_form.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/utils/constants.dart';

class CheckOutScreen extends BaseView<CheckoutController> {
  CheckOutScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Checkout"),
      backgroundColor: Colors.green,
    );
  }

  String paymentMethodGroupValue = PaymentMethod.cod;
  @override
  Widget body(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final ServiceModel service = Get.arguments;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection('Service Info'),
            // ProductInfo(),
            customServiceTile(
              'Maid Service',
              service.image.toString(),
            ),
            SizedBox(height: screenHeight * 0.02),
            buildHeaderSection('Order Summary'),
            orderSummary(),
            SizedBox(height: screenHeight * 0.02),
            buildHeaderSection('Service Address'),
            const ShippingForm(),
            SizedBox(height: screenHeight * 0.01),
            // PaymentMethod(),
            buildPaymentMethodSection(controller: controller),
            SizedBox(height: screenHeight * 0.1),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveOrder,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'CONFIRM ORDER',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderSummary() {
    return  Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal:'),
                Text('${controller.cartItem.first.servicePrice}${Constants.banglaCurrency}'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax:'),
                Text('+6.70${Constants.banglaCurrency}'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${controller.cartItem.first.discountModel.discount}%:'),
                Text('- ${controller.getDiscountAmount(controller.cartItem.first.discountModel.hashCode, controller.cartItem.first.servicePrice)}${Constants.banglaCurrency}'),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Grand Total:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('470.25${Constants.banglaCurrency}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  }

  Widget buildHeaderSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

// Widget to display order summary




Widget customServiceTile(String title, String imagePath) {
  return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: SizedBox(
          height: 70,
          width: 80,
          child: Image.network(
            'http://172.16.154.43/images/services/$imagePath',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(subtitle),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon(Icons.star, color: Colors.green, size: 16),
                Text('Duration \n3 Weeks  '),
                SizedBox(width: 5),
                Expanded(child: Text('Starting From \n20 January 2024')),
              ],
            ),
          ],
        ),
      ));
}

Widget buildPaymentMethodSection({required CheckoutController controller}) {
  return Card(
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Radio<String>(
            activeColor: Colors.green,
            value: PaymentMethod.cod,
            groupValue: controller.paymentMethodGroupValue.value,
            onChanged: (value) {
              controller.paymentMethodGroupValue.value = value!;
            },
          ),
          const Text(PaymentMethod.cod),
          Radio<String>(
            activeColor: Colors.green,
            value: PaymentMethod.online,
            groupValue: controller.paymentMethodGroupValue.value,
            onChanged: (value) {
              controller.paymentMethodGroupValue.value = value!;
            },
          ),
          const Text(PaymentMethod.online),
        ],
      ),
    ),
  );
}

abstract class PaymentMethod {
  static const String cod = 'Cash on Delivery';
  static const String online = 'Online Payment';
}
