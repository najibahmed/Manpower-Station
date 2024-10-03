import 'package:flutter/material.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/help_support/view/help_view.dart';
import 'package:manpower_station/app/modules/home/views/home_view.dart';
import 'package:manpower_station/app/modules/menu/views/menu_view.dart';
import 'package:manpower_station/app/modules/order_history/view/order_history_view.dart';
import 'package:manpower_station/app/modules/search_view/view/search_screen.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';

class DashboardScreen extends BaseView<DashBoardController> {
  const DashboardScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: IndexedStack(
      index: controller.selectedIndex.value,
      children: const [
        HomeView(),
        OrderHistoryView(),
        SearchScreen(),
        MenuView(),
      ],
    ));
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}
