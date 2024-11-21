import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/components/lottie_loading.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';

import '../../../components/custom_loading_overlay.dart';

class BookingHistoryDetails extends BaseView<BookingsController> {
  const BookingHistoryDetails({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    BookingsModel booking = Get.arguments[0];
    String title = Get.arguments[1];
    return SafeArea(
      child: CustomScrollView(slivers: [
        /// AppBar
        SliverAppBar(
            // leading: IconButton(
            //     onPressed: () {
            //       Get.back();
            //       controller.isLoading.value=true;
            //     },
            //     icon: const Icon(
            //       Icons.arrow_back,
            //       color: Colors.white,
            //     )),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(title),
              ],
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
        SliverToBoxAdapter(
          child: controller.isLoading.value
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LottieLoading()
                    // _buildCardShimmer(screenHeight, screenWidth),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Payment Summary
                      _paymentSummary(screenWidth, screenHeight, booking),
                      SizedBox(height: screenHeight * 0.02),

                      ///Action Buttons
                      _buildActionButtons(context),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        height: screenHeight * .01,
                        color:Theme.of(context).cardColor,
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      /// Message and booking information
                      _messageCard(screenWidth, screenHeight, booking),
                      SizedBox(height: screenHeight * 0.03),

                      ///Service Card
                      _serviceDetails(screenWidth, screenHeight, booking),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        height: screenHeight * .01,
                        color: Theme.of(context).cardColor,
                      ),

                      ///Worker Card
                      _workerDetailsCard(screenHeight, screenWidth),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        height: screenHeight * .01,
                        color: Theme.of(context).cardColor,
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      ///Service & Worker Review
                      Card(
                        elevation: 2,
                        // color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Review Service',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 1,
                                    minRating: 0.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 36,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double value) {
                                      controller.userRating.value = value;
                                    },
                                  ),
                                  Text(
                                    "${controller.userRating.value} ⭐",
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  focusNode: controller.focusNode,
                                  maxLines: 2,
                                  controller: controller.reviewController,
                                  decoration: const InputDecoration(
                                    // fillColor: Colors.white,
                                    filled: true,
                                    labelText: 'Give a review',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12)),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      CustomSnackBar.showCustomErrorToast(
                                          message: 'Please write review',
                                          duration: const Duration(seconds: 1));
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Center(
                                child: SizedBox(
                                  height: screenHeight * 0.04,
                                  width: screenWidth * 0.25,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      giveReview(booking);
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                    ],
                  ),
                ),
        ),
      ]),
    );
  }

/// Payment summary section
  Column _paymentSummary(
      double screenWidth, double screenHeight, BookingsModel booking) {
    return Column(
      children: [
        Text(
          'Payment Summary',
          style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.grey,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Price:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${Constants.banglaCurrency} ${booking.totalAmount}.00'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Advanced Amount:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${Constants.banglaCurrency} ${booking.advanceAmount}.00'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Due Amount:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${Constants.banglaCurrency} ${booking.weWillGetPayment}.00'),
          ],
        ),
      ],
    );
  }

  /// Review method
  void giveReview(booking) {
    if (controller.formKey.currentState!.validate()) {
      if (controller.reviewController.text.trim().isNotEmpty) {
        try {
          controller.focusNode.unfocus();
          showLoadingOverLay(
              asyncFunction: controller.giveUserReview(
                  booking.services!.first.service!.id, booking.id),
              msg: 'Loading');
          controller.reviewController.clear();
        } catch (e) {
          CustomSnackBar.showCustomErrorToast(
              message: 'Giving review error: $e',
              duration: const Duration(seconds: 1));
        }
      }
    }
  }

  /// Message card with bookingId and booking date
  Card _messageCard(
      double screenWidth, double screenHeight, BookingsModel booking) {
    return Card(
      // color: Colors.grey[100],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text('Your service  is ${booking.isPaymentStatus}'),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Booking ID:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${booking.id}'),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Booked On:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(Constants.formatDateTime
                    .format(DateTime.parse(booking.user!.createdAt!))),
              ],
            ),
          ],
        ),
      ),
    );
  }
/// Service details section
  Widget _serviceDetails(
      double screenWidth, double screenHeight, BookingsModel booking) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Details',
            style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: screenHeight * 0.01),
          Center(
            child: Text('${booking.services?.first.service?.name}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: LightThemeColors.primaryColor,
                    fontSize: screenWidth * 0.05)),
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Service Price Starting:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  '${Constants.banglaCurrency} ${booking.services?.first.service?.servicePrice}.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Time Scheduled:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${booking.services?.first.timeSchedule}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Work Starting Date:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(Constants.formatDateTime.format(
                  DateTime.parse(booking.services!.first.workStartDate!))),
            ],
          ),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Address:   ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${booking.area}, ${booking.address}, ${booking.city}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _workerDetailsCard(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Worker Details',
            style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: SizedBox(
                  height: screenHeight * 0.13,
                  width: screenWidth * 0.25,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${Constants.avatarImgUrl}${controller.workersData.value?.avatar}',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                  ),
                  //  Image.network(
                  //   '${Constants.avatarImgUrl}${controller.workersData.value?.avatar}',
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${controller.workersData.value?.username}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: LightThemeColors.primaryColor,
                                  fontSize: screenWidth * 0.05)),
                          Text('   ${controller.workersData.value?.ratings} ⭐',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.04)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Gender:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('${controller.workersData.value?.gender}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Contact:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('${controller.workersData.value?.phoneOrEmail}'),
                        ],
                      ),
                      Wrap(
                        children: [
                          const Text('Address:   ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              '${controller.workersData.value?.area}, ${controller.workersData.value?.address}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
/// Action Button on payment summary
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
                /// Handle cancel booking
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

          /// Payment button
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
        ],
      ),
    );
  }
}
