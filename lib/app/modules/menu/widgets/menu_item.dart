// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        elevation: 4,
        child: ListTile(
            leading: Icon(icon, color: LightThemeColors.primaryColor),
            title: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            tileColor: Theme.of(context).cardColor,
            onTap: onTap
        ),
      ),
    );
  }
}
