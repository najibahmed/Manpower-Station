
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget{
  const LottieLoading({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
     child: LottieBuilder.asset(
       'assets/manpower_logo_animi.json',
       width: 400,
       height: 400,
       fit: BoxFit.fill,
     ),
   );
  }

}