import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:manpower_station/app/modules/help_support/view/help_view.dart';
import 'package:manpower_station/app/modules/home/views/home_view.dart';
import 'package:manpower_station/app/modules/menu/views/menu_view.dart';
import 'package:manpower_station/app/modules/order_history/view/order_history_view.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';

class DashboardView extends BaseView<DashBoardController>{


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomeView(),
            OrderHistoryView(),
            HelpView(),
            MenuView(),

          ],
        ));
  }
 @override
  Widget? bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: controller.onItemTapped,
      currentIndex: controller.selectedIndex.value,
      selectedItemColor: LightThemeColors.primaryColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_outlined),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
    );
  }
}