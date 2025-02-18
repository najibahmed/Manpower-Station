import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/routes/app_pages.dart';


import 'utils/constants.dart';
class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    // _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1),() async {
      final isUserLoggedIn =await MySharedPref.getLoginStatus();
      if(isUserLoggedIn){
        Get.offNamed(AppPages.DashboardView);
      }else{
        Get.offNamed(AppPages.SignIn);
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
      body:

      Image.asset(
        Constants.appSplashUrl,
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),

    );
  }
}