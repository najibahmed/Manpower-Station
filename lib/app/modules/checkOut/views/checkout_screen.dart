import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/app/modules/checkOut/views/shipping_form.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/utils/constants.dart';

class CheckOutScreen extends BaseView<CheckoutController>{
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection('Service Info'),
            // ProductInfo(),
            customServiceTile(
              'Maid Service',
              'Complete floor cleaning and sanitization for a sparkling clean space.',
              4.9,
              2125,
              service.image.toString(),
            ),
            SizedBox(height: screenHeight*0.02),
            buildHeaderSection('Order Summary'),
            OrderSummary(),
            SizedBox(height: screenHeight*0.02),
            buildHeaderSection('Service Address'),
            ShippingForm(),
            SizedBox(height: screenHeight*0.01),
            // PaymentMethod(),
            buildPaymentMethodSection( controller:controller),
            SizedBox(height: screenHeight*0.1),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
Widget buildHeaderSection(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
    ),
  );
}
// Widget to display product info
class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.network('https://via.placeholder.com/100'),
      title: Text('Maid Service'),
      subtitle: Text('Size: M 11.5\nIn Stock'),
      // trailing: IconButton(
      //   onPressed: () {},
      // icon: Icon(Icons.edit),
      // ),
    );
  }
}

// Widget to display shipping information
class ShippingInfo extends StatelessWidget {
  const ShippingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('1. Shipping Information'),
        subtitle: Text('Michael Gallagher\n1234 Pike Street #555\nSeattle, WA 98101'),
        trailing: TextButton(
          onPressed: () {},
          child: Text('Edit'),
        ),
      ),
    );
  }
}

// Widget to display payment method
// class PaymentMethod extends StatelessWidget {
//   const PaymentMethod({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text('2. Payment Method'),
//         subtitle: Text('Michael Gallagher\nVisa Platinum\n**** **** **** 6789\nEXP 10/22'),
//         trailing: TextButton(
//           onPressed: () {},
//           child: Text('Edit'),
//         ),
//       ),
//     );
//   }
// }

// Widget to display order summary
class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal:'),
                Text('${Constants.banglaCurrency}450'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax:'),
                Text('${Constants.banglaCurrency}6.70'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${Constants.banglaCurrency}470.25', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for confirm order button
class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
        },
        child: Text('CONFIRM ORDER',style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
Widget customServiceTile(String title, String subtitle, double rating,
    int reviews, String imagePath) {
  return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(

        contentPadding: EdgeInsets.all(16.0),
        leading: Container(
          height: 70,
          width: 80,
          child: Image.network(
            'http://172.16.154.43/images/services/$imagePath',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
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