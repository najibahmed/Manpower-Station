import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';
import 'package:manpower_station/app/modules/menu/widgets/menu_item.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

import '../../../../config/theme/dark_theme_colors.dart';


class MenuView extends BaseView<MenusController>{
  const MenuView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
        centerTitle: true,
        backgroundColor:
        Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
        title: Text(
          'Menu',
          style: TextStyle(
            fontSize: MyFonts.appBarTittleSize,
          ),
        ));
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Obx(() => Text(
            controller.userName.value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          Obx(() => Text(
            controller.phoneNumber.value,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          )),
          const SizedBox(height: 30),
          MenuItem(icon: Icons.payment, text: 'Digital payment'),
          MenuItem(icon: Icons.language, text: '${Strings.changeLanguage.tr}'),
          MenuItem(icon: Icons.privacy_tip, text: 'Privacy policy'),
          MenuItem(icon: Icons.document_scanner, text: 'Terms & Conditions'),
          MenuItem(icon: Icons.info_outline, text: 'About Us'),
        ],
      ),
    );
  }
}