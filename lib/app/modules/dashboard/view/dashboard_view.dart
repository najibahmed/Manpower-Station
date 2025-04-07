import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/bookings/view/bookings_view.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/home/views/home_view.dart';
import 'package:manpower_station/app/modules/menu/views/menu_view.dart';
import 'package:manpower_station/app/modules/search_view/view/search_screen.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/app_Images.dart';


class DashboardScreen extends GetView<DashBoardController> {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        bool? exitApp = await Get.defaultDialog(
          title: "Exit App",
          middleText: "Are you sure you want to exit?",
          textConfirm: "Yes",
          confirmTextColor: Colors.black87,
          cancelTextColor: Colors.black87,
          textCancel: "No",
          onConfirm: () {
            Get.back(); // Close dialog
            if (Platform.isAndroid) {
              SystemNavigator.pop(); // Close app on Android
            } else {
              exit(0); // Close app on iOS & other platforms
            }
          },
        );
      },
      child: Obx(()=> Scaffold(
        bottomNavigationBar:ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [LightThemeColors.primaryColor,
                LightThemeColors.secondaryColor],
            ).createShader(bounds);
          },
          blendMode: BlendMode.color,
          child: BottomNavigationBar(
            // backgroundColor: LightThemeColors.primaryColor,
            onTap: controller.onItemTapped,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: LightThemeColors.primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_outlined),
                  label: 'Bookings',
                  backgroundColor: LightThemeColors.primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: 'Search',
                  backgroundColor: LightThemeColors.primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                  backgroundColor: LightThemeColors.primaryColor),
            ],
          ),
        ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight), // Standard AppBar height
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    LightThemeColors.primaryColor,LightThemeColors.secondaryColor], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              // leading: InkWell(
              //   onTap: () => LocalizationService.updateLanguage(
              //     LocalizationService.getCurrentLocal().languageCode == 'bn'
              //         ? 'en'
              //         : 'bn',
              //   ),
              //   child: SizedBox(
              //     height: 30.h,
              //     width: 30.h,
              //     child: SvgPicture.asset(
              //       'assets/vectors/language.svg',
              //       color: Colors.white,
              //       fit: BoxFit.none,
              //       height: 10,
              //       width: 10,
              //     ),
              //   ),
              // ),
              title: Image.asset(
                AppImages.instance.manpower_Logo,
                fit: BoxFit.cover,
                // color:  controller.isLightMode.value? Colors.white : LightThemeColors.primaryColor,
                color:  Colors.white,
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () async {
                          // CustomSnackBar.showCustomSnackBar(title: 'Authenticated', message: 'Successfully Logged In');
                          //     CustomSnackBar.showCustomToast(message: 'Successfully Logged In');
                          // Get.to(const MyPay());
                          // print(
                          //     'access token----${MySharedPref.getAccessToken()}');
                          // print(
                          //     "refresh token---${await MySharedPref.getRefreshToken()}");
                          // print(
                          //     "userId----${await MySharedPref.getUserId()}");
                        },
                        icon:  Icon(
                          Icons.notifications_active_outlined,
                          color: !Get.isDarkMode
                              ?  Colors.white: LightThemeColors.primaryColor,
                        )),
                    // InkWell(
                    //   onTap: ()  {
                    //     controller.isLightMode.value=  Get.isDarkMode;
                    //     MyTheme.changeTheme();
                    //   },
                    //   child: SizedBox(
                    //     height: 39.h,
                    //     width: 39.h,
                    //     child: SvgPicture.asset(
                    //       controller.isLightMode.value ? 'assets/vectors/moon.svg' : 'assets/vectors/sun.svg',
                    //       fit: BoxFit.none,
                    //       color: Colors.white,
                    //       height: 10,
                    //       width: 10,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.black26,
              ),
            ),
          ),),
          body:SafeArea(
              child: IndexedStack(
                index: controller.selectedIndex.value,
                children: const [
                  HomeView(),
                  BookingHistoryView(),
                  SearchScreen(),
                  MenuView(),
                ],
              ),),
        ),
      ),
    );
}}
