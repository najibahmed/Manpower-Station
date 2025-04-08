import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final Color? color;
  double size;
  final String text;

  SmallText({super.key, this.color, required this.text, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto", //GoogleFonts.acme().fontFamily,
        fontSize: size.sp,
        color: color ?? Theme.of(context).textTheme.bodySmall!.color,
      ),
    );
  }
}
