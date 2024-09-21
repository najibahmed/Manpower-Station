import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/utils/constants.dart';
class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),() async {
      final isUserLoggedIn =await MySharedPref.getLoginStatus();
      if(isUserLoggedIn){
        Get.offAllNamed(AppPages.Registration);
      }else{
        Get.offAllNamed(AppPages.DashboardView);
      }
    },);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.black26,
        ),
      ),
      body: Image.asset(
        Constants.appSplashUrl,
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
    );
  }
}