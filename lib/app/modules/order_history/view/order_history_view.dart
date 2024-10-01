import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

import '../../../../config/theme/dark_theme_colors.dart';

class OrderHistoryView extends BaseView<OrderController> {
  const OrderHistoryView({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
    AppBar(
      backgroundColor: Get.isDarkMode
          ? DarkThemeColors.backgroundColor
          : LightThemeColors.backgroundColor,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: SizedBox(
          height: 40,
          child: TabBar(
            indicatorColor: Colors.green,
            labelStyle: const TextStyle(color: Colors.green),
            controller: controller.tabController,
            tabs: const [
              Tab(text: 'Active Order'),
              Tab(text: 'Order History'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white30,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  indicatorWeight: 6,
                  dividerColor: Colors.grey,
                  indicatorColor: Colors.green,
                  labelStyle: const TextStyle(color: Colors.green),
                  controller: controller.tabController,
                  tabs: const [
                    Tab(text: 'Active Order'),
                    Tab(text: 'Order History'),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: const [
                      ActiveOrder(),
                      OrderHistory(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    // Get the screen size for responsive design
    final size = MediaQuery.of(context).size;
    final double cardWidth = size.width * 0.9; // 90% of screen width
    final double cardPadding = size.width * 0.05;
    // 5% padding
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 22, right: 22),
      child: Column(
        children: [
          Container(
            width: cardWidth,
            padding: EdgeInsets.all(cardPadding),
            decoration: BoxDecoration(
              color: Colors.green[100], // Background color of the card
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 6,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildButtonRow(context),
                Text(
                  'Office Cleaning',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 10),
                _buildServiceDetails(),
                const SizedBox(height: 5),
                _buildReviewSection(controller: controller),
                const SizedBox(height: 20),
                _buildActionButtons(context),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  // Button Row (Booking Info Button)
  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
            title: 'Booking info', height: 35, width: 120, onTap: () {}),
        _buildStatusRow()
      ],
    );
  }

  // Service Details Section
  Widget _buildServiceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Total Price:', '549.00 Tk'),
        _buildDetailRow('Advance:', '99.00 Tk'),
      ],
    );
  }

  // Status and Review Row
  Widget _buildStatusRow() {
    return Row(
      children: [
        const Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Chip(
          elevation: 5,
          label: Row(
            children: [
              const Text(
                'Confirmed',
                style: TextStyle(
                    color: Colors.black87,
                    wordSpacing: 5,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: Colors.amber[600],
        ),
      ],
    );
  }

  // Rating (Stars)
  Widget _buildReviewSection({required controller}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text('Review:', style: TextStyle(fontWeight: FontWeight.bold)),
      RatingBar.builder(
        initialRating: 0.0,
        minRating: 0.0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        ignoreGestures: false,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          controller.userRating.value = rating;
        },
      ),
    ]);
  }

  // Action Buttons (Cancel Booking & Payment)
  Widget _buildActionButtons(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.5;
    return Container(
      child: Center(
        child: Column(
          children: [
            // Cancel booking button
            SizedBox(
              height: 40,
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  // Handle cancel booking
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Cancel booking',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Payment button
            CustomButton(
                title: "Payment", height: 40, width: buttonWidth, onTap: () {}),
          ],
        ),
      ),
    );
  }

  // Utility function to create rows for price details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

class OrderHistory extends StatelessWidget {
  const OrderHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              child: Center(
                child: Image.asset(
                  'assets/images/no_order_history.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Center(
                child: Text(
              Strings.noActiveHistory.tr,
              style: TextStyle(
                fontSize: MyFonts.displayMediumSize,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
