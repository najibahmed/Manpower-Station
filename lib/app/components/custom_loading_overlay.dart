import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:manpower_station/utils/app_Images.dart';

import '../../config/translations/strings_enum.dart';

/// this method will show black overlay which look like dialog
/// and it will have loading animation inside of it
/// this will make sure user cant interact with ui until
/// any (async) method is executing cuz it will wait for async function
/// to end and then it will dismiss the overlay
showLoadingOverLay({required Future<void>  asyncFunction,String? msg,}) async
{
  await Get.showOverlay(asyncFunction: () async {
    try{
      await asyncFunction;
    }catch(error){
      Logger().e(error);
      Logger().e(StackTrace.current);
    }
  },loadingWidget: Center(
    child: _getLoadingIndicator(msg: msg),
  ),opacity: 0.7,
    opacityColor: Colors.black,
  );
}



Widget _getLoadingIndicator({String? msg}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20.w,
      vertical: 10.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: Colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/manpower_name_logo.png',
          height: 45.h,
        ),
        SizedBox(
          width: 3.h,
        ),
        const CircularProgressIndicator(),
        SizedBox(
          width: 4.h,
        ),
        Text(msg ?? Strings.loading.tr, style: Get.theme.textTheme.bodyLarge),
      ],
    ),
  );
}

void showSuccessDialog({required String title, required String successMsg}) {
  Get.defaultDialog(
    title: title,
    titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    content: Column(
      children: [
        Image.asset(
          AppImages.instance.paymentDone,
          color: Colors.green, // Replace with your actual image path
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 10),
        Text(
          successMsg,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
    barrierDismissible: false,
    confirm: ElevatedButton(
      onPressed: () => Get.back(),
      child: const Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
