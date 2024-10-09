import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/constants.dart';

class BookingHistoryView extends BaseView<BookingsController> {
  const BookingHistoryView({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  onTap: (index) {
                    controller.changeTabIndex(index);
                  },
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
            child: SizedBox(
              child: Column(
                children: [
                  _getTabAtIndex(controller.tabIndex.value, controller),
                  // TabBarView(
                  //   controller: controller.tabController,
                  //   children:  [
                  //     ActiveOrder( controller: controller,),
                  //     OrderHistory(),
                  //   ],
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _getTabAtIndex(
  int index,
  BookingsController controller,
) {
  var list = [
    ActiveOrder(
      controller: controller,
    ),
    const OrderHistory(),
  ];
  return list[index];
}

class ActiveOrder extends StatelessWidget {
  final BookingsController controller;
  ActiveOrder({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final bookings = controller.bookingsList;

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 22, right: 22),
      child: Obx(
        () => Column(
            children: List.generate(
          bookings.length,
          (index) {
            BookingsModel booking = bookings[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildContainer(booking, context),
            );
          },
        ).toList()
            //
            ),
      ),
    ));
  }

  Container buildContainer(BookingsModel booking, BuildContext context) {
    // Get the screen size for responsive design
    final size = MediaQuery.of(context).size;
    final double cardWidth = size.width * 0.9; // 90% of screen width
    final double cardPadding = size.width * 0.05;
    // 5% padding
    return Container(
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
          _buildButtonRow(context, booking),
          Text(
            booking.services!.first.service!.name!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: size.height * 0.01),
          _buildServiceDetails(booking),
          SizedBox(height: size.height * 0.02),
          booking.isPaymentStatus == "Completed" ? const SizedBox():_buildActionButtons(context),
        ],
      ),
    );
  }

  // Button Row (Booking Info Button)
  Widget _buildButtonRow(BuildContext context, BookingsModel booking) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
            title: 'Booking info',
            height: screenWidth * 0.1,
            width: screenWidth * 0.3,
            onTap: () {}),
        Row(
          children: [
            const Text('Status:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: screenWidth * 0.02),
            Chip(
                elevation: 5,
                label: Row(
                  children: [
                    Text(
                      '${booking.isPaymentStatus}',
                      style: const TextStyle(
                          color: Colors.black87,
                          wordSpacing: 5,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                backgroundColor: booking.isPaymentStatus == "Pending"
                    ? Colors.red
                    : booking.isPaymentStatus == "Confirmed"
                        ? Colors.amber[600]
                        : Colors.green),
          ],
        )
      ],
    );
  }

  // Service Details Section
  Widget _buildServiceDetails(BookingsModel booking) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
            'Total Price:', "${booking.totalAmount.toString()}.00Tk"),
        _buildDetailRow(
            'Advance Payment:', "${booking.advanceAmount.toString()}.00Tk"),
        _buildDetailRow(
            'Due Payment:', "${booking.weWillGetPayment.toString()}.00Tk"),
        _buildDetailRow(
            'Starting Date:',
            Constants.formatDate.format(
                DateTime.parse(booking.services!.first.workStartDate!))),
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
    final double buttonWidth = MediaQuery.of(context).size.width * 0.35;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Cancel booking button
          SizedBox(
            height: 35,
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
                'Cancel Booking',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Payment button
          SizedBox(
            height: 35,
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                // Handle cancel booking
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Pay Due',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // CustomButton(
          //     title: "Payment", height: 25, width: buttonWidth, onTap: () {}),
        ],
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
            Center(
              child: Image.asset(
                'assets/images/no_order_history.png',
                fit: BoxFit.cover,
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

enum BookingStatus { Pending, Confirmed, Completed }
