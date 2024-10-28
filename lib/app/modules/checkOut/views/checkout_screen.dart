import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/dash_divider.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/checkOut/controller/checkout_controller.dart';
import 'package:manpower_station/app/modules/checkOut/views/shipping_form.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';

import '../../../../config/theme/dark_theme_colors.dart';

class CheckOutScreen extends BaseView<CheckoutController> {
  CheckOutScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Checkout",style:  TextStyle(
          fontSize: 22,letterSpacing: 1 ,fontWeight: FontWeight.bold, color: Colors.white),),
      leading: IconButton(
          onPressed: () {
            Get.back();
            // controller.worker.clear();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      // backgroundColor: LightThemeColors.primaryColor,
    );
  }

  String paymentMethodGroupValue = PaymentMethod.cod;
  @override
  Widget body(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection('Service Info'),
            /// Service Info,
            customServiceTile(
                controller.cartItem.first, screenHeight, screenWidth,controller),
            SizedBox(height: screenHeight * 0.015),
            buildHeaderSection('Worker Info'),

            /// Worker Info,
            customWorkerTile(
                controller.worker.first, screenHeight, screenWidth,controller),
            SizedBox(height: screenHeight * 0.015),

            ///Order Summary
            buildHeaderSection('Order Summary'),
            orderSummary(controller.cartItem.first),
            SizedBox(height: screenHeight * 0.015),

            ///Shipping Form
            buildHeaderSection('Service Address'),
            const ShippingForm(),
            SizedBox(height: screenHeight * 0.01),

            /// PaymentMethod(),
            // buildPaymentMethodSection(controller: controller),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveOrder,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: LightThemeColors.primaryColor,
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
      color: controller.isLightMode.value
          ? DarkThemeColors.cardColor
          : LightThemeColors
          .cardColor,
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
                    '${Constants.banglaCurrency} ${controller.serviceController.cartSubtotal}.00'),
              ],
            ),
             SizedBox(height: 10.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax:'),
                Text('${Constants.banglaCurrency} +6.70'),
              ],
            ),
             SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Discount: ${item.discountModel.discount}${item.discountModel.discountType == "Percentage Discount" ? '%' : Constants.banglaCurrency}'),
                Text(
                    '- ${Constants.banglaCurrency} ${controller.getDiscountAmount(item.discountModel, controller.serviceController.cartSubtotal.value)}'),
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
                Text(
                    '${Constants.banglaCurrency} ${controller.getGrandTotal()}.00',
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
Widget customWorkerTile(
    WorkerModel worker, double screenHeight, double screenWidth, CheckoutController controller) {
  return Card(
    color: controller.isLightMode.value
        ? DarkThemeColors.cardColor
        : LightThemeColors
        .cardColor,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          child: SizedBox(
            height: screenHeight * 0.12,
            width: screenWidth * 0.34,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
              '${Constants.avatarImgUrl}${worker.avatar}',
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
              progressIndicatorBuilder:
                  (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
            ),
            // Image.network(
            //   '${Constants.avatarImgUrl}${worker.avatar}',
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                worker.username!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Gender:  ${worker.gender!}",
                style:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
              Text(
                "Area:  ${worker.area!}",
                style:
                    const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
              Row(
                children: [
                  Text(
                    "Rating:  ${worker.ratings!} ",
                    style:
                        const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  const Icon(Icons.star,size: 16,color: Colors.orangeAccent,)
                ],
              ),
            ],
          ),
        ))
      ],
    ),
  );
}

// Custom Service Tile
Widget customServiceTile(
    CartModel item, double screenHeight, double screenWidth, CheckoutController controller) {
  return Card(
    color: controller.isLightMode.value
        ? DarkThemeColors.cardColor
        : LightThemeColors
        .cardColor,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          child: SizedBox(
            height: screenHeight * 0.15,
            width: screenWidth * 0.34,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
              '${Constants.serviceImgUrl}${item.serviceImageUrl}',
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
              progressIndicatorBuilder:
                  (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.serviceName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              // const Divider(color: Colors.black26,),
              const MySeparator(),
              SizedBox(height: screenHeight * 0.01 ),
              RichText(
                text: TextSpan(
                    text: 'Duration:    ',
                    style:
                    TextStyle(
                        fontSize: MyFonts.bodyMediumSize,
                        fontWeight: FontWeight.normal,
                        color: controller.isLightMode.value
                            ? DarkThemeColors.displayTextColor
                            :  Colors.black45),
                    children: [
                      TextSpan(
                        text: item.serviceTimeSchedule,
                        style: TextStyle(
                            fontSize: MyFonts.bodyMediumSize,
                            fontWeight: FontWeight.bold,
                            color:controller.isLightMode.value
                                ? DarkThemeColors.displayTextColor
                                :  Colors.white),
                      ),
                    ]),
              ),
              const SizedBox(width: 5),
              RichText(
                text: TextSpan(
                    text: 'Starting Date :  ',
                    style: TextStyle(
                        fontSize: MyFonts.bodyMediumSize,
                        fontWeight: FontWeight.normal,
                        color: controller.isLightMode.value
                            ? DarkThemeColors.displayTextColor
                            :  Colors.black45),
                    children: [
                      TextSpan(
                        text: Constants.formatDate
                            .format(DateTime.parse(item.startingDate)),
                        style: TextStyle(
                            fontSize: MyFonts.bodyMediumSize,
                            fontWeight: FontWeight.bold,
                            color: controller.isLightMode.value
                                ? DarkThemeColors.displayTextColor
                                :  Colors.white),
                      ),
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: 'Time at:   ',
                    style: TextStyle(
                        fontSize: MyFonts.bodyMediumSize,
                        fontWeight: FontWeight.normal,
                        color: controller.isLightMode.value
                            ? DarkThemeColors.displayTextColor
                            :  Colors.black45),
                    children: [
                      TextSpan(
                        text: Constants.formatTime
                            .format(DateTime.parse(item.startingDate)),
                        style: TextStyle(
                            fontSize: MyFonts.bodyMediumSize,
                            fontWeight: FontWeight.bold,
                            color:controller.isLightMode.value
                                ? DarkThemeColors.displayTextColor
                                :  Colors.white),
                      ),
                    ]),
              )
            ],
          ),
        ))
      ],
    ),
  );
}

Widget buildPaymentMethodSection({required CheckoutController controller}) {
  return Card(
    color: Colors.grey[100],
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
