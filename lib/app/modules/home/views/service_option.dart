import 'package:flutter/material.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';

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
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Material(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: LightThemeColors.primaryColor,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}