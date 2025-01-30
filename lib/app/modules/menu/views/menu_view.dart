
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/menu/widgets/menu_item.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/app_Images.dart';
import 'package:manpower_station/utils/helper_function.dart';
import '../../../components/big_text.dart';
import '../controller/menu_controller.dart';

class MenuView extends BaseView<MenusController> {
  const MenuView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final userController = Get.put(UserController());
    final userController = Get.find<UserController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // controller.allServiceData.isEmpty
            //     ? _menuProfileShimmer()
            //     :
            SizedBox(height: screenHeight * 0.05,),
            Hero(
              tag: userController.userData!.value.id ??"null",
              child: SizedBox(
                height: screenHeight * 0.12,
                width: screenWidth * 0.25,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow:  [
                      BoxShadow(
                        spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(0.4),
                          offset: const Offset(1, 4))
                    ],
                    color: Colors.grey.withOpacity(.30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: userController.userData?.value.avatar != null
                        ? HelperFunction.instance.isSvgOrJpg(
                            "${userController.userData?.value.avatar}", context)
                        : const Icon(
                            Icons.person,
                            color: LightThemeColors.primaryColor,
                            size: 60,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Text(
            //   controller.userName.value,
            //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            BigText(text: "${userController.userData!.value.username}"),
            Container(
                height: screenHeight * .035,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(.30),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 3,
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(1, 3))
                  ],
                ),
                child: Center(
                  child: BigText(
                    text: "${userController.userData!.value.user?.email}",size: 14,),
                )),
            // Text(
            //   userController.userData!.value.user!.email.toString(),
            //   style: Theme.of(context).textTheme.displayMedium,
            // ),
            SizedBox(height: 20.h),
            MenuItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Get.toNamed(AppPages.UserProfile);
              },
            ),
            // MenuItem(icon: Icons.payment, text: 'Digital payment', onTap: () {  },),
            // MenuItem(
            //   icon: Icons.language,
            //   text: Strings.changeLanguage.tr,
            //   onTap: () {},
            // ),
            MenuItem(
              icon: Icons.support_agent_outlined,
              text: 'Customer Support',
              onTap: () {
                Get.toNamed(AppPages.SupportScreen);
              },
            ),
            MenuItem(
              icon: Icons.privacy_tip,
              text: 'Privacy policy',
              onTap: () {
              },
            ),
            // MenuItem(icon: Icons.document_scanner, text: 'Terms & Conditions', onTap: () {  },),
            MenuItem(
              icon: Icons.info_outline,
              text: 'About Us',
              onTap: () {},
            ),
            MenuItem(
              icon: Icons.exit_to_app_outlined,
              text: 'Exit',
              onTap: () {
                showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showLogoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Logout'),
              const Spacer(),
              Image.asset(AppImages.instance.manpower_Logo),
            ],
          ),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No', style: TextStyle(color: LightThemeColors.primaryColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Get.find<MenusController>().clearSharedPrefData();
                Get.offAllNamed(AppPages.SignIn);
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: LightThemeColors.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}


