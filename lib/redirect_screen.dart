import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/app_Images.dart';
class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Total duration for both animations
    );

    // First text fades in during the first half of the duration
    _fadeInAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _controller.forward(); // Start the animations
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),() async {
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
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/manpower_logo_animi.json',
              width: 400,
              height: 400,
              fit: BoxFit.fill,
            ),
            AnimatedBuilder(
              animation: _fadeInAnimation1,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeInAnimation1.value,
                  child: Image.asset(AppImages.instance.manpower_Logo,color: LightThemeColors.primaryColor,)
                );
              },
            ),
          ],
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