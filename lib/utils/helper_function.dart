import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';

getFormattedDate(DateTime dt, {String pattern = 'yyyy-MM-dd – kk:mm'}) =>
    DateFormat(pattern).format(dt);

getParsedDate(String dt, {String pattern = 'yyyy-MM-dd – kk:mm'}) =>
    DateFormat(pattern).parse(dt);

String get generateOrderId =>
    'PB_${getFormattedDate(DateTime.now(), pattern: 'yyyyMMdd_HH:mm:ss')}';

String calculatePriceAfterDiscount(num price, num discount) {
  final discountAmount = (price * discount) / 100;
  return (price - discountAmount).toStringAsFixed(0);
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