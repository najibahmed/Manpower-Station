import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';

import '../../../utils/app_Images.dart';
import '../../routes/app_pages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Image.asset(
          AppImages.instance.manpower_Logo,
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white12,
          ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration:  BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.instance.onBoarding1),
                                fit: BoxFit.cover),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(10))),
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.instance.onBoarding2),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                            bottom: Radius.circular(70),
                          ),
                        ),
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.3,
                      ),
                      Container(
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(AppImages.instance.onBoarding3),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.2,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 40),
                  const Text.rich(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "The ",
                        ),
                        TextSpan( text: "Manpower Station ",
                            style: TextStyle(color:LightThemeColors.primaryColor)),
                        TextSpan(
                            text: "App ",
                        ),
                        TextSpan(text: "That Makes Your Life Easier")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      // style: TextStyle(color: MyColors.secondaryColor),
                      textAlign: TextAlign.center,
                      "We are committed to providing excellence and elegance in service."),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                        Size(screenWidth * 0.9, 60),
                        // backgroundColor: MyColors.primaryColor
                    ),
                    onPressed: () async{
                   await MySharedPref.setOnBoardingStatus(true);
                   Get.offAllNamed(AppPages.Registration);
                    },
                    child: const Text(
                      "Let's Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 19),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
