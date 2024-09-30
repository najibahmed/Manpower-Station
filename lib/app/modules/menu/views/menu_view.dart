// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/menu/controller/menu_controller.dart';
import 'package:manpower_station/app/modules/menu/widgets/menu_item.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';



class MenuView extends BaseView<MenusController>{
  const MenuView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
   return null;
  }

  @override
  Widget body(BuildContext context) {
    final userController=Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: 40.h),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
           SizedBox(height: 10.h),
          // Text(
          //   controller.userName.value,
          //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          Text(
            userController.userData.value.phoneOrEmail.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          MenuItem(icon: Icons.person, text: 'Profile', onTap: () { Get.toNamed(AppPages.UserProfile); },),
          // MenuItem(icon: Icons.payment, text: 'Digital payment', onTap: () {  },),
          MenuItem(icon: Icons.language, text: '${Strings.changeLanguage.tr}', onTap: () {  },),
          MenuItem(icon: Icons.support_agent_outlined, text: 'Customer Support', onTap: () { 
            Get.toNamed(AppPages.SupportScreen);
          },),
          MenuItem(icon: Icons.privacy_tip, text: 'Privacy policy', onTap: () {  },),
          // MenuItem(icon: Icons.document_scanner, text: 'Terms & Conditions', onTap: () {  },),
          MenuItem(icon: Icons.info_outline, text: 'About Us', onTap: () {  },),
          MenuItem(icon: Icons.exit_to_app_outlined, text: 'Exit', onTap: () {
            MySharedPref.setLoginStatus(false);
            Get.offAllNamed(AppPages.Registration);
          },),
        ],
      ),
    );
  }
}