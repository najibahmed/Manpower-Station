import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomSnackBar {
  static showCustomSnackBar({required String title, required String message,Duration? duration})
  {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      icon: const Icon(Icons.check_circle, color: Colors.white,),
    );
  }


  static showCustomErrorSnackBar({required String title, required String message,Color? color,Duration? duration})
  {
    Get.snackbar(
      title,
      message,animationDuration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
      duration: duration ?? const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
      colorText: Colors.white,
      backgroundColor: color ?? Colors.redAccent,
      icon: const Icon(Icons.error, color: Colors.white,),
    );
  }


  static showCustomToast({String? title, required String message,Color? color,Duration? duration}){
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? LightThemeColors.primaryColor,
      onTap: (snack){
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }

  static void showFlutterToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = LightThemeColors.primaryColor,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static showCustomErrorToast({String? title, required String message,Color? color,Duration? duration}){
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.redAccent,
      onTap: (snack){
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
