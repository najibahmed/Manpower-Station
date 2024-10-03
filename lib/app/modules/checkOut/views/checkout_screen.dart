import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/app/modules/checkOut/views/shipping_form.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';


class CheckOutScreen extends BaseView<CheckoutController> {
  CheckOutScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Checkout"),
      leading: IconButton(
          onPressed: () {
            Get.back();
            // controller.worker.clear();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      backgroundColor: LightThemeColors.primaryColor,
    );
  }

  String paymentMethodGroupValue = PaymentMethod.cod;
  @override
  Widget body(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection('Service Info'),
            // ProductInfo,
            customServiceTile(controller.cartItem.first),
            SizedBox(height: screenHeight * 0.02),
            buildHeaderSection('Worker Info'),
            // Worker Info,
            customWorkerTile(controller.worker.first),
            SizedBox(height: screenHeight * 0.02),
            buildHeaderSection('Order Summary'),
            orderSummary(controller.cartItem.first),
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

// Widget to display order summary
  Widget orderSummary(CartModel item) {
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
                const Text('Subtotal:'),
                Text(
                    '${controller.serviceController.cartSubtotal}${Constants.banglaCurrency}'),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax:'),
                Text('+6.70${Constants.banglaCurrency}'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount: ${item.discountModel.discount}${item.discountModel.discountType=="Percentage Discount"? '%' : Constants.banglaCurrency }'),
                Text(
                    '- ${controller.getDiscountAmount(item.discountModel, controller.serviceController.cartSubtotal.value)}${Constants.banglaCurrency}'),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Grand Total:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${controller.getGrandTotal()}${Constants.banglaCurrency}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
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

// Custom Worker Tile
Widget customWorkerTile(WorkerModel worker) {
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
            'http://172.16.154.43/images/avatars/${worker.avatar}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          worker.username!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // subtitle: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // Text(subtitle),
        //     SizedBox(height: 5),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         // Icon(Icons.star, color: Colors.green, size: 16),
        //         Text('Duration \n${item.serviceTimeSchedule}'),
        //         SizedBox(width: 5),
        //         Expanded(
        //             child: Text(
        //                 'Starting From \n${Constants.formatDate.format(DateTime.parse(item.startingDate))}')),
        //       ],
        //     ),
        //   ],
        // ),
      ));
}

// Custom Service Tile
Widget customServiceTile(CartModel item) {
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
            'http://172.16.154.43/images/services/${item.serviceImageUrl}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.serviceName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(subtitle),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon(Icons.star, color: Colors.green, size: 16),
                Text('Duration \n${item.serviceTimeSchedule}'),
                const SizedBox(width: 5),
                Expanded(
                    child: Text(
                        'Starting From \n${Constants.formatDate.format(DateTime.parse(item.startingDate))}')),
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
