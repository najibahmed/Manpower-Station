import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/bookings/view/bookings_view.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/home/views/home_view.dart';
import 'package:manpower_station/app/modules/menu/views/menu_view.dart';
import 'package:manpower_station/app/modules/search_view/view/search_screen.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_theme.dart';
import 'package:manpower_station/config/translations/localization_service.dart';

class DashboardScreen extends GetView<DashBoardController> {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      bottomNavigationBar:BottomNavigationBar(
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
              label: 'Order',
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
        appBar: AppBar(
          // backgroundColor: Colors.white,
          centerTitle: true,
          leading: InkWell(
            onTap: () => LocalizationService.updateLanguage(
              LocalizationService.getCurrentLocal().languageCode == 'bn'
                  ? 'en'
                  : 'bn',
            ),
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: SvgPicture.asset(
                'assets/vectors/language.svg',
                color: Colors.white,
                fit: BoxFit.none,
                height: 10,
                width: 10,
              ),
            ),
          ),
          title: Image.asset(
            'assets/images/manpower_name_logo.png',
            fit: BoxFit.cover,
            color:  controller.isLightMode.value? Colors.white : LightThemeColors.primaryColor,
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () async {
                      // Get.to(const MyPay());
                      print(
                          'access token----${MySharedPref.getAccessToken()}');
                      print(
                          "refresh token---${await MySharedPref.getRefreshToken()}");
                      print(
                          "userId----${await MySharedPref.getUserId()}");
                    },
                    icon:  Icon(
                      Icons.notifications_active_outlined,
                      color: controller.isLightMode.value ?  Colors.white: LightThemeColors.primaryColor,
                    )),
                InkWell(
                  onTap: ()  {
                    controller.isLightMode.value=  Get.isDarkMode;
                    MyTheme.changeTheme();
                  },
                  child: SizedBox(
                    height: 39.h,
                    width: 39.h,
                    child: SvgPicture.asset(
                      controller.isLightMode.value ? 'assets/vectors/moon.svg' : 'assets/vectors/sun.svg',
                      fit: BoxFit.none,
                      color: Colors.white,
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.black26,

          ),
        ),
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
    );
}}
