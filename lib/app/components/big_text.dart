import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  double size;
  final String text;
  TextOverflow overflow;
  BigText({super.key,this.color,required this.text,this.overflow=TextOverflow.ellipsis,this.size=20});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily:"Roboto" ,//GoogleFonts.acme().fontFamily,
        fontSize: size.sp,
        color: color?? Theme.of(context).textTheme.bodyLarge!.color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}