import 'package:flutter/material.dart';

import '../../config/theme/light_theme_colors.dart';

class CustomGradientBar extends StatelessWidget {
  final AppBar appBar;
  const CustomGradientBar({super.key,required this.appBar});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight), // Standard AppBar height
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              LightThemeColors.primaryColor,LightThemeColors.secondaryColor], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: appBar,
      ),);
  }
}
