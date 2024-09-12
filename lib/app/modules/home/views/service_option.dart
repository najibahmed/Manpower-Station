import 'package:flutter/material.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

class ServiceOption extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const ServiceOption({
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: size.height*.12,
          width: size.width*.2,
        color: LightThemeColors.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: size.height*.02,),
                Text(label,textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MyFonts.bodyMediumSize),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}