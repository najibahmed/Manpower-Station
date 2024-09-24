
import 'package:flutter/material.dart';
import '../../config/theme/light_theme_colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  double height;
  double width;
  final VoidCallback onTap;
  CustomButton({super.key,required this.title,required this.height, required this.width,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:LightThemeColors.buttonColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))
        ),
          onPressed: onTap,
          child: Center(
            child: Text(title,overflow:TextOverflow.visible,style: const TextStyle(
              color: LightThemeColors.buttonTextColor,
              fontWeight: FontWeight.bold
            ),),
          )),
    );
  }
}
