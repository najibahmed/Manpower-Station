import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

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
        IconButton(
            onPressed: () {
              Get.toNamed(AppPages.UpdateProfile);
            },
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ))
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    var user = controller.userData.value.user;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement body
    return controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight  * 0.02,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Material(
                        child: SizedBox(
                          height: 100,
                          width: 80,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.30),
                            radius: 100,
                            child: Stack(
                              children: [
                                controller.profilePic.value != null
                                    ? Image.file(
                                        controller.profilePic.value!,
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(
                                        Icons.person,
                                        color: LightThemeColors.primaryColor,
                                        size: 60,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                _buildUserFieldCard(
                    'Name', Icons.person_outline_sharp,"UserName"),
                 SizedBox(
                  height: screenHeight * 0.002,
                ),
                _buildUserFieldCard(
                    'Account', Icons.phone_android_outlined,
                    controller.userData.value.phoneOrEmail ??
                "Login Email or phone number here."),
                 SizedBox(
                  height: screenHeight * 0.002,
                ),
                _buildUserFieldCard(
                    'Description',
                    Icons.info_outline,"In Flutter, text right overflow occurs when the text content exceeds the available width of its container, causing the text to be clipped or truncated."
                    ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                _buildUserFieldCard(
                    'Address', Icons.home_outlined,"UserAddress"),
                _buildUserFieldCard(
                    'Area', Icons.signpost_outlined,"UserArea"),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppPages.UpdateEmailPhone);
                  },
                  leading: const Icon(Icons.perm_device_information),
                  title: Text(
                      "Change Email or Phone Number Here!",style: TextStyle(color: Colors.black),),
                  trailing: Icon(Icons.compare_arrows,color: Colors.black,)),
                const SizedBox(
                  height: 15,
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
          );
  }

  _buildUserFieldCard(String title, IconData icon,String subTitle) {
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
                color: Colors.grey,
              ),
              SizedBox(
                width: 18.h,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
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
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Divider(thickness: 1,color: Colors.black.withOpacity(.15),)
              ],
            ),
          ),

        ],
      ),
    );
  }


}
