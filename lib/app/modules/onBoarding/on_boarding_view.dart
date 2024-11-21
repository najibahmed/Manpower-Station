import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/onBoarding/on_boarding_controller.dart';
import 'package:manpower_station/app/modules/onBoarding/welcome_screen.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/app_Images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white12,
          ),
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const WelcomeScreen()));
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 40, top: 10),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    controller.currentPage.value = value;
                  },
                  controller: controller.pageController,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Image.asset(
                            height: MediaQuery.of(context).size.height * 0.5,
                            AppImages.instance.onBoarding1,
                          ),
                          const SizedBox(height: 20),
                          const Text.rich(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Seamless ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: LightThemeColors.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                    text: "Worker Experience",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            textAlign: TextAlign.center,
                            "An intuitive design that makes it easy for customers to find what they're looking for.",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Image.asset(
                            height: MediaQuery.of(context).size.height * 0.5,
                            AppImages.instance.onBoarding2,
                          ),
                          const SizedBox(height: 20),
                          const Text.rich(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "Wishlist: Where ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500,color: LightThemeColors.primaryColor)),
                                TextSpan(
                                  text: "Worker Service ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                    text: "Begins",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            textAlign: TextAlign.center,
                            "Can explore the latest service, get helped by service workers,and get supported in your necessity.",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Image.asset(
                            height: MediaQuery.of(context).size.height * 0.5,
                            AppImages.instance.onBoarding3,
                          ),
                          const SizedBox(height: 20),
                          const Text.rich(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "Choose Your ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                TextSpan(
                                  text: "Desired ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: LightThemeColors.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                    text: "Schedule, Duration and Time",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            textAlign: TextAlign.center,
                            "Desired Scheduling is an essential part of creating a personalized service experience",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: controller.currentPage.value != 0
                                  ? LightThemeColors.primaryColor
                                  : Colors.white)),
                      onPressed: () {
                        if (controller.currentPage.value != 0) {
                          controller.currentPage.value--;
                          controller.pageController.animateToPage(
                              controller.currentPage.value,
                              duration: Durations.medium1,
                              curve: Curves.linear);
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: controller.currentPage.value != 0
                            ? LightThemeColors.primaryColor
                            : Colors.white,
                      ),
                    ),
                    SmoothPageIndicator(
                        effect: const ColorTransitionEffect(
                            activeDotColor: LightThemeColors.primaryColor),
                        controller: controller.pageController,
                        count: 3),
                    IconButton.filled(
                      style: IconButton.styleFrom(
                          backgroundColor: LightThemeColors.primaryColor),
                      onPressed: () {
                        if (controller.currentPage.value == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const WelcomeScreen()));
                        }
                        controller.currentPage.value++;
                        controller.pageController.animateToPage(
                            controller.currentPage.value,
                            duration: Durations.long1,
                            curve: Curves.linear);
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
