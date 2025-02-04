import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/small_text.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/helper_function.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../models/bookings_model.dart';
import '../../../routes/app_pages.dart';
import '../controller/bookings_controller.dart';

class BookingItemCard extends StatelessWidget {
  const BookingItemCard({
    super.key,
    required this.size,
    required this.booking,
    required this.controller,
  });

  final Size size;
  final BookingsModel booking;
  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: booking.isPaymentStatus == 'Pending'
          ? Container(
              width: size.width * 1,
              padding: EdgeInsets.all(size.width * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          booking.services!.first.service == null
                              ? "Service Name Empty"
                              : "${booking.services!.first.service!.name}",
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            onPressed: () async {
                              if (await HelperFunction.instance.isInternetConnected()) {
                                showLoadingOverLay(
                                    asyncFunction: controller.deleteBookingService(booking.id!),
                                    msg: "Deleting");
                              } else {}
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buildDetailRow('Service Price:',
                      "${booking.services!.first.service!.servicePrice!}.00 Tk"),
                  const Row(
                    children: [
                      Text('Booking Status:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        ' Incompleted',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Payment Status:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        ' ${booking.paymentid?.paidStatus ?? "null"}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SmallText(
                    text:
                        "Note: Please re-order the service and ensure the minimum advance payment to confirm the service.",
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  )
                ],
              ),
            )
          : Container(
              width: size.width * 1,
              padding: EdgeInsets.all(size.width * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Booking info Button & Status
                  buildButtonRow(context, booking, controller),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// Service Title
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      booking.services!.first.service == null
                          ? "Service Name Empty"
                          : "${booking.services!.first.service!.name}",
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),

                  /// Service Details
                  buildServiceDetails(booking),
                  SizedBox(height: size.height * 0.02),

                  /// Bottom Action Buttons (Cancel Booking & Payment)
                  booking.isPaymentStatus == 'Completed'
                      ? const SizedBox()
                      : buildActionButtons(context, booking, controller),
                ],
              ),
            ),
    );
  }
}

/// Service Details Section
Widget buildServiceDetails(BookingsModel booking) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildDetailRow('Total Price:', "${booking.totalAmount.toString()}.00Tk"),
      buildDetailRow(
          'Advance Payment:', "${booking.advanceAmount.toString()}.00Tk"),
      buildDetailRow(
          'Due Payment:', "${booking.weWillGetPayment.toString()}.00Tk"),
      buildDetailRow(
          'Starting Date:',
          Constants.formatDateTime.format(DateTime.parse(
              booking.services!.first.workStartDate ??
                  "2024-12-12T06:09:00.000Z"))),
    ],
  );
}

/// Action Buttons (Cancel Booking & Payment)
Widget buildActionButtons(BuildContext context, BookingsModel booking,
    BookingsController controller) {
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
            onPressed: () async{
              /// Handle cancel booking
              if (await HelperFunction.instance.isInternetConnected()) {
                showLoadingOverLay(
                    asyncFunction: controller.changeOrderStatus(
                        booking.id,
                        booking.isPaymentStatus == ServiceStatus.Cancelled.name
                            ? ServiceStatus.Confirmed.name
                            : ServiceStatus.Cancelled.name),
                    msg: "Updating Status");
              }else{

              }
              // controller.changeOrderStatus(
              //     booking.id,
              //     booking.isPaymentStatus == ServiceStatus.Cancelled.name ? ServiceStatus.Confirmed.name :ServiceStatus.Cancelled.name
              // );
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                  color: booking.isPaymentStatus == ServiceStatus.Cancelled.name
                      ? Colors.green
                      : Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              booking.isPaymentStatus == ServiceStatus.Cancelled.name
                  ? "Re-Confirm"
                  : 'Cancel Booking',
              style: TextStyle(
                  color: booking.isPaymentStatus == ServiceStatus.Cancelled.name
                      ? Colors.green
                      : Colors.red,
                  fontSize: 12),
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
              controller.payDueAmount(
                amount:
                    "${booking.totalAmount!.round() - booking.advanceAmount!.round()}",
                bookingId: booking.id!,
                clientName: booking.username!,
                clientPhone: booking.phone!,
                clientArea: booking.area!,
                clientState: booking.state!,
                clientCity: booking.city!,
                clientAddress: booking.address!,
              );
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

/// Utility function to create rows for price details
Widget buildDetailRow(String label, String value) {
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

/// Button Row (Booking Info Button)
Widget buildButtonRow(BuildContext context, BookingsModel booking,
    BookingsController bookingController) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    child: GetBuilder<BookingsController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenHeight * 0.04,
            // width: screenWidth * 0.35,
            child: OutlinedButton(
              onPressed: () {
                bookingController.isLoading.value = true;
                bookingController
                    .getWorkerInformation("${booking.workers!.first.user}");
                Future.delayed(const Duration(seconds: 3), () {
                  bookingController.isLoading.value = false;
                });
                Get.toNamed(AppPages.OrderHistoryDetails, arguments: [
                  booking,
                  // booking.isPaymentStatus
                ]);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Theme.of(context).focusColor,
                side:
                    BorderSide(width: 1.0, color: Theme.of(context).focusColor),
              ),
              child: Text(
                "Booking Details",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Text('Status:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: screenWidth * 0.02),
              Text(
                '${booking.isPaymentStatus}',
                style: TextStyle(
                    fontSize: 14,
                    color: booking.isPaymentStatus == "Confirmed"
                        ? Colors.blue
                        : booking.isPaymentStatus == "Cancelled"
                            ? Colors.redAccent
                            : Colors.green,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      );
    }),
  );
}
