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
      final userMapString =await MySharedPref.getLoginStatus();
      if(userMapString){
        // Get.offAll(()=>const SignInPage(),transition: Transition.rightToLeftWithFade );
        Get.toNamed(AppPages.Registration,);
      }else{
        Get.toNamed(AppPages.DashboardView);
        // Get.offAll(()=>const DashBoardPage(),transition: Transition.rightToLeftWithFade );
      }
    },);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
        ),
      ),
      body: Image.asset(
        Constants.appSplashUrl,
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
    );;
  }
}