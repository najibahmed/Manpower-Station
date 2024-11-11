import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';
class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),() async {
      final isUserLoggedIn =await MySharedPref.getLoginStatus();
      if(isUserLoggedIn){
        Get.offNamed(AppPages.Registration);
      }else{
        Get.offNamed(AppPages.DashboardView);
      }
    },);

    return Scaffold(
      extendBodyBehindAppBar: false,
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.dark,
      //     statusBarColor: Colors.white12,
      //   ),
      // ),
      body: Center(
        child: LottieBuilder.asset(
          'assets/manpower_logo_animi.json',
          width: 400,
          height: 400,
          fit: BoxFit.fill,
        ),
      ),
      // Image.asset(
      //   Constants.appSplashUrl,
      //   width: Get.width,
      //   height: Get.height,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}