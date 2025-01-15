import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/big_text.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/helper_function.dart';

// ignore: must_be_immutable
class UserProfileScreen extends BaseView<UserController> {
  TextStyle myTextStyle = TextStyle(
      color: LightThemeColors.primaryColor, fontSize: MyFonts.appBarTittleSize);

  UserProfileScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: LightThemeColors.primaryColor,
          )),
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      centerTitle: true,
      title: Text(
        "User Profile",
        style: myTextStyle.copyWith(
            color: LightThemeColors.primaryColor, fontWeight: FontWeight.bold),
      ),
      actions: [
        controller.userData != null
            ? IconButton(
                onPressed: () {
                  Get.toNamed(AppPages.UpdateProfile);
                },
                icon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ))
            : const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement body
    return controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: controller.userData!.value.id!,
                    child: SizedBox(
                      height: screenHeight * 0.14,
                      width: screenWidth * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(.30),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 5,
                                color: Colors.grey.withOpacity(0.4),
                                offset: Offset(1, 4))
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: controller.userData?.value.avatar != null
                              ? HelperFunction.instance.isSvgOrJpg(
                                  "${controller.userData?.value.avatar}", context)
                              : const Icon(
                                  Icons.person,
                                  color: LightThemeColors.primaryColor,
                                  size: 60,
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  BigText(text: "${controller.userData!.value.username}"),
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
                              offset: Offset(1, 3))
                        ],
                      ),
                      child: Center(
                        child: BigText(
                          text: "${controller.userData!.value.user!.email}",size: 14,),
                      )),

                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: ListTile(
                        tileColor: Theme.of(context).cardColor,
                        onTap: () {
                          Get.toNamed(AppPages.UpdateEmailPhone);
                        },
                        leading: const Icon(Icons.perm_device_information),
                        title: Text(
                          "Change Email or Phone Number Here!",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        trailing: Icon(
                          Icons.compare_arrows,
                          color: Theme.of(context).iconTheme.color,
                        )),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  _buildUserFieldCard('Name', Icons.person_outline_sharp,
                      "${controller.userData?.value.username}", context),
                  SizedBox(
                    height: screenHeight * 0.002,
                  ),
                  _buildUserFieldCard(
                      'Account',
                      Icons.phone_android_outlined,
                      controller.userData?.value.phoneOrEmail ??
                          "Login Email or phone number here.",
                      context),
                  SizedBox(
                    height: screenHeight * 0.002,
                  ),
                  _buildUserFieldCard(
                      'Description',
                      Icons.info_outline,
                      "${controller.userData?.value.profileDescription}",
                      context),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  _buildUserFieldCard('Address', Icons.home_outlined,
                      "${controller.userData?.value.address}", context),
                  _buildUserFieldCard('Area', Icons.signpost_outlined,
                      "${controller.userData?.value.area}", context),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  // CustomListTileEditButton(
                  //     context:context,
                  //     title:  'Email',
                  //     onEdit:(value) async {
                  //       await controller.updateUserProfileField(FieldType.email, value);
                  //   print('this is value-->$value');
                  // }, icon: Icons.phone_android_outlined, subTitle:  controller.userData.value.phoneOrEmail??'Update Email Address'),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
  }

  _buildUserFieldCard(
      String title, IconData icon, String subTitle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: Colors.green,
              ),
              SizedBox(
                width: 18.h,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 2.h),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.justify,
                  subTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black.withOpacity(.15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
