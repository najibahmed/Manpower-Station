import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/app_Images.dart';
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   floating: false,
          //   bottom: PreferredSize(
          //     preferredSize: const Size.fromHeight(0),
          //     child: SizedBox(
          //       // height: 40,
          //       child: TabBar(
          //         onTap: (index) {
          //           controller.changeTabIndex(index);
          //         },
          //         indicatorWeight: 6,
          //         dividerColor: Colors.grey,
          //         indicatorColor: Colors.orangeAccent,
          //         labelStyle: const TextStyle(color: Colors.white),
          //         //TextStyle(color: Colors.green),
          //         controller: controller.tabController,
          //         tabs: const [
          //           Tab(text: 'Active Order'),
          //           Tab(text: 'Order History'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          controller.bookingsList.isEmpty
              ? SliverPadding(
                  padding: EdgeInsets.all(9),
                  sliver: SliverToBoxAdapter(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 22, right: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Center(
                          child: Image.asset(
                            AppImages.instance.noOrderHistory,
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
                  )),
                )
              : SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: controller.bookingsList.length,
                          (context, index) {
                    final size = MediaQuery.of(context).size;
                    final double cardWidth =
                        size.width * 1; // 100% of screen width
                    final double cardPadding = size.width * 0.03;
                    final booking = controller.bookingsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: cardWidth,
                        padding: EdgeInsets.all(cardPadding),
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
                            _buildButtonRow(context, booking, controller),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),

                            /// Service Title
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).highlightColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 4),
                                // child: Text(
                                //   overflow: TextOverflow.ellipsis,
                                //   booking.services!.first.service==null? "Service Name Empty":"${booking.services!.first.service!.name}",
                                //   style: Theme.of(context).textTheme.displayLarge,
                                //   textAlign: TextAlign.start,
                                // ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),

                            /// Service Details
                            _buildServiceDetails(booking),
                            SizedBox(height: size.height * 0.02),

                            /// Bottom Action Buttons (Cancel Booking & Payment)
                            booking.isPaymentStatus == 'Completed'
                                ? const SizedBox()
                                : _buildActionButtons(context, booking),
                          ],
                        ),
                      ),
                    );
                  }))),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     child: Column(
          //       children: [
          //         _getTabAtIndex(controller.tabIndex.value),
          //         // TabBarView(
          //         //   controller: controller.tabController,
          //         //   children: const [
          //         //     ActiveOrder(),
          //         //     OrderHistory(),
          //         //   ],
          //         // ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  /// Service Details Section
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
            Constants.formatDateTime.format(DateTime.parse(
                booking.services!.first.workStartDate ??
                    "2024-12-12T06:09:00.000Z"))),
      ],
    );
  }

  /// Action Buttons (Cancel Booking & Payment)
  Widget _buildActionButtons(BuildContext context, BookingsModel booking) {
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
                controller.changeOrderStatus(booking.id, "Cancelled");
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

  /// Utility function to create rows for price details
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

/// Button Row (Booking Info Button)
Widget _buildButtonRow(BuildContext context, BookingsModel booking,
    BookingsController bookingController) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: screenHeight * 0.04,
        width: screenWidth * 0.35,
        child: OutlinedButton(
          onPressed: () {
            bookingController.isLoading.value = true;
            bookingController
                .getWorkerInformation("${booking.workers!.first.user}");
            Future.delayed(const Duration(seconds: 3), () {
              bookingController.isLoading.value = false;
            });
            Get.toNamed(AppPages.OrderHistoryDetails,
                arguments: [booking, booking.isPaymentStatus]);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            side: BorderSide(width: 1.0, color: Theme.of(context).focusColor),
          ),
          child: const Text(
            "Booking Details",
            style:
                TextStyle(fontSize: 14, color: LightThemeColors.primaryColor),
          ),
        ),
      ),
      Row(
        children: [
          const Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: screenWidth * 0.02),
          Text(
            '${booking.isPaymentStatus}',
            style: TextStyle(
                fontSize: 14,
                color: booking.isPaymentStatus == "Pending"
                    ? Colors.amber[600]
                    : booking.isPaymentStatus == "Confirmed"
                        ? Colors.blue
                        : Colors.green,
                letterSpacing: 1,
                fontWeight: FontWeight.w600),
          ),
        ],
      )
    ],
  );
}

// Widget _getTabAtIndex(int index) {
//   var list = [
//     const ActiveOrder(),
//     const OrderHistory(),
//   ];
//   return list[index];
// }

/// First Tab page
// class ActiveOrder extends StatelessWidget {
//   const ActiveOrder({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size for responsive design
//     final size = MediaQuery.of(context).size;
//     final double cardWidth = size.width * 1; // 100% of screen width
//     final double cardPadding = size.width * 0.03;
//     return SingleChildScrollView(
//         child: Padding(
//       padding: const EdgeInsets.only(top: 12.0, left: 16, right: 16),
//       child: GetX<BookingsController>(builder: (bController) {
//         final bookings = bController.bookingsList;
//         if (bookings.isEmpty) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Center(
//                   child: Image.asset(
//                     AppImages.instance.noOrderHistory,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .04,
//                 ),
//                 Center(
//                     child: Text(
//                   Strings.noActiveHistory.tr,
//                   style: TextStyle(
//                     fontSize: MyFonts.displayMediumSize,
//                   ),
//                 ))
//               ],
//             ),
//           );
//         } else {
//           return Column(
//               children: List.generate(
//             bookings.length,
//             (index) {
//               BookingsModel booking = bookings[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: cardWidth,
//                   padding: EdgeInsets.all(cardPadding),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black12),
//                     color: Theme.of(context).cardColor,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.withOpacity(0.1),
//                         spreadRadius: 5,
//                         blurRadius: 6,
//                         offset:
//                             const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ///Booking info Button & Status
//                       _buildButtonRow(context, booking, bController),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.01,
//                       ),
//
//                       /// Service Title
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).highlightColor,
//                             borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10))),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 6.0, vertical: 4),
//                           // child: Text(
//                           //   overflow: TextOverflow.ellipsis,
//                           //   booking.services!.first.service==null? "Service Name Empty":"${booking.services!.first.service!.name}",
//                           //   style: Theme.of(context).textTheme.displayLarge,
//                           //   textAlign: TextAlign.start,
//                           // ),
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.01),
//
//                       /// Service Details
//                       _buildServiceDetails(booking),
//                       SizedBox(height: size.height * 0.02),
//
//                       /// Bottom Action Buttons (Cancel Booking & Payment)
//                       booking.isPaymentStatus == 'Completed'
//                           ? const SizedBox()
//                           : _buildActionButtons(context, bController),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ).toList());
//         }
//       }),
//     ));
//   }
//
//   /// Button Row (Booking Info Button)
//   Widget _buildButtonRow(BuildContext context, BookingsModel booking,
//       BookingsController bookingController) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           height: screenHeight * 0.04,
//           width: screenWidth * 0.35,
//           child: OutlinedButton(
//             onPressed: () {
//               bookingController.isLoading.value = true;
//               bookingController
//                   .getWorkerInformation("${booking.workers!.first.user}");
//               Future.delayed(const Duration(seconds: 3), () {
//                 bookingController.isLoading.value = false;
//               });
//               Get.toNamed(AppPages.OrderHistoryDetails,
//                   arguments: [booking, booking.isPaymentStatus]);
//             },
//             style: OutlinedButton.styleFrom(
//               backgroundColor: Theme.of(context).dialogBackgroundColor,
//               side: BorderSide(width: 1.0, color: Theme.of(context).focusColor),
//             ),
//             child: const Text(
//               "Booking Details",
//               style:
//                   TextStyle(fontSize: 14, color: LightThemeColors.primaryColor),
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             const Text('Status:',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(width: screenWidth * 0.02),
//             Text(
//               '${booking.isPaymentStatus}',
//               style: TextStyle(
//                   fontSize: 14,
//                   color: booking.isPaymentStatus == "Pending"
//                       ? Colors.amber[600]
//                       : booking.isPaymentStatus == "Confirmed"
//                           ? Colors.blue
//                           : Colors.green,
//                   letterSpacing: 1,
//                   fontWeight: FontWeight.w600),
//             ),
//           ],
//         )
//       ],
//     );
//   }
//
//   /// Service Details Section
//   Widget _buildServiceDetails(BookingsModel booking) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDetailRow(
//             'Total Price:', "${booking.totalAmount.toString()}.00Tk"),
//         _buildDetailRow(
//             'Advance Payment:', "${booking.advanceAmount.toString()}.00Tk"),
//         _buildDetailRow(
//             'Due Payment:', "${booking.weWillGetPayment.toString()}.00Tk"),
//         _buildDetailRow(
//             'Starting Date:',
//             Constants.formatDateTime.format(
//                 DateTime.parse(booking.services!.first.workStartDate!))),
//       ],
//     );
//   }
//
//   /// Action Buttons (Cancel Booking & Payment)
//   Widget _buildActionButtons(
//       BuildContext context, BookingsController bookingController) {
//     final double buttonWidth = MediaQuery.of(context).size.width * 0.35;
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           // Cancel booking button
//           SizedBox(
//             height: 35,
//             width: buttonWidth,
//             child: OutlinedButton(
//               onPressed: () {
//                 /// Handle cancel booking
//                 print(bookingController.isLightMode.value);
//               },
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: Colors.red),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'Cancel Booking',
//                 style: TextStyle(color: Colors.red, fontSize: 12),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//
//           /// Payment button
//           SizedBox(
//             height: 35,
//             width: buttonWidth,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle cancel booking
//               },
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'Pay Due',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Utility function to create rows for price details
//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }

/// Second tab page
// class OrderHistory extends StatelessWidget {
//   const OrderHistory({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.2,
//             ),
//             Center(
//               child: Image.asset(
//                 AppImages.instance.noOrder,
//                 scale: 0.7,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .04,
//             ),
//             Center(
//                 child: Text(
//               Strings.noActiveHistory.tr,
//               style: TextStyle(
//                 fontSize: MyFonts.displayMediumSize,
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
