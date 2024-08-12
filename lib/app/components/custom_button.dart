import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

class CustomButton extends StatelessWidget {
  String title;
  double height;
  double width;
  final VoidCallback onTap;
  CustomButton({super.key,required this.title,required this.height, required this.width,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:LightThemeColors.buttonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))
        ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Text(title,overflow:TextOverflow.visible,style: TextStyle(
                color: LightThemeColors.buttonTextColor,
                fontSize: MyFonts.bodyMediumSize,
                fontWeight: FontWeight.bold
              ),),
            ),
          )),
    );
  }
}
