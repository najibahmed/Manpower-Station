// ignore_for_file: depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/utils/constants.dart';

import 'app_Images.dart';

class HelperFunction {
  static HelperFunction instance = HelperFunction();

  ///  Singleton pattern
  // static HelperFunction _instance;
//   static get instance => _instance;
//
// //private constructor
//   HelperFunction._internal();
//
//   // Factory constructor implementing Singleton
//   factory HelperFunction() {
//     _instance ??= HelperFunction._internal();
//     return _instance!;
//   }

  getFormattedDate(DateTime dt, {String pattern = 'yyyy-MM-dd – kk:mm'}) =>
      DateFormat(pattern).format(dt);

  getParsedDate(String dt, {String pattern = 'yyyy-MM-dd – kk:mm'}) =>
      DateFormat(pattern).parse(dt);

  String get generateOrderId =>
      'PB_${getFormattedDate(DateTime.now(), pattern: 'yyyyMMdd_HH:mm:ss')}';

  num getDiscountAmount(discount, num price) {
    if (discount.discountType == "Percentage Discount") {
      return price - ((price * discount.discount!) / 100).round();
    } else {
      return price - discount.discount!;
    }
  }

  /// Device
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check image format
  Widget isSvgOrJpg(String imageUrl, BuildContext context) {
    // Check for .svg extension
    if (imageUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        '${Constants.avatarImgUrl}$imageUrl',
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        fit: BoxFit.cover,
        placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const Center(child: CircularProgressIndicator())),
      ); // It's an SVG file
    }
    // Check for .jpg or .jpeg extension
    if (imageUrl.toLowerCase().endsWith('.jpg') ||
        imageUrl.toLowerCase().endsWith('.jpeg') ||
        imageUrl.toLowerCase().endsWith('.png')) {
      return CachedNetworkImage(
        errorWidget: (context, url, error) =>
            Image.asset(AppImages.instance.imgPerson,fit: BoxFit.cover,),
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        imageUrl: '${Constants.avatarImgUrl}$imageUrl',
        // height: 120,
        // width: double.infinity,
        fit: BoxFit.cover,
      );
    }
    // You can handle other cases or return false if it doesn't match SVG or JPG
    return const SizedBox(
      child: Center(
        child: Text("image file format nor jpg,jpeg,png neither svg"),
      ),
    ); // Assuming it's not a known image type
  }

  Widget buildServiceCardShimmer() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: const Column(
        children: [
          ShimmerWidget.rectangular(height: 120),
          SizedBox(
            height: 10,
          ),
          ShimmerWidget.rectangular(
            height: 20,
            width: 110,
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                  alignment: Alignment.center,
                  child: ShimmerWidget.rectangular(
                    height: 20,
                    width: 150,
                  ))),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  /// Shimmmer Widget for booking details
  Widget buildCardShimmer(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenHeight * 0.01),
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ShimmerWidget.rectangular(
                    height: screenHeight * 0.035, width: screenWidth * 0.4),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(
                        height: screenHeight * 0.02, width: screenWidth * 0.4),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.23,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.15,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.45,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.2,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.3,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        ShimmerWidget.rectangular(
            height: screenHeight * .18, width: screenWidth * 1),
        SizedBox(height: screenHeight * 0.03),
        ShimmerWidget.rectangular(
            height: screenHeight * 0.03, width: screenWidth * 0.3),
        SizedBox(height: screenHeight * 0.01),
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(
                        height: screenHeight * 0.02, width: screenWidth * 0.4),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.23,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.15,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.45,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    ShimmerWidget.rectangular(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        ShimmerWidget.rectangular(
            height: screenHeight * 0.03, width: screenWidth * 0.3),
        SizedBox(height: screenHeight * 0.01),
        SizedBox(
            height: screenHeight * .2,
            child: Card(
              elevation: 3,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          child: SizedBox(
                            child: ShimmerWidget.rectangular(
                              height: screenHeight * 0.17,
                              width: screenWidth * 0.25,
                            ),
                            //  Image.network(
                            //   '${Constants.avatarImgUrl}${controller.workersData.value?.avatar}',
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.3),
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.1),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.2),
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.2),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.3),
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.2),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Wrap(
                                  children: [
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.2),
                                    SizedBox(width: screenWidth * 0.1),
                                    ShimmerWidget.rectangular(
                                        height: screenHeight * 0.02,
                                        width: screenWidth * 0.2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  )),
            ))
      ]),
    );
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
