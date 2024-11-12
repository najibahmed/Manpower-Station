// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/utils/constants.dart';

getFormattedDate(DateTime dt, {String pattern = 'yyyy-MM-dd – kk:mm'}) =>
    DateFormat(pattern).format(dt);

getParsedDate(String dt, {String pattern = 'yyyy-MM-dd – kk:mm'}) =>
    DateFormat(pattern).parse(dt);

String get generateOrderId =>
    'PB_${getFormattedDate(DateTime.now(), pattern: 'yyyyMMdd_HH:mm:ss')}';

num getDiscountAmount(discount,num price) {
  if(discount.discountType=="Percentage Discount"){
    return price-((price * discount.discount!) / 100).round();
  }else{
    return price-discount.discount!;
  }
}
/// Device
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context){
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
    return Image.network(
      '${Constants.avatarImgUrl}$imageUrl',
      height: 120,
      width: double.infinity,
      fit: BoxFit.cover,
    ); // It's a JPG/JPEG file
  }

  // You can handle other cases or return false if it doesn't match SVG or JPG
  return const SizedBox(child: Center(
    child: Text("image file format nor jpg,jpeg,png neither svg"),
  ),); // Assuming it's not a known image type
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
