import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

import '../../components/custom_button.dart';
import '../../routes/app_pages.dart';

class VerificationCompleted extends BaseView<AuthenticationController>{
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      centerTitle: false,
      titleSpacing: -30.0,
      backgroundColor:
      Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      title: Image.asset(
        'assets/images/manpower_name_logo.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            child: Center(
              child: Image.asset(
                'assets/images/verification_done.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          RichText(text:TextSpan(text: "${Strings.successful.tr}\n",
              style: TextStyle(fontSize: MyFonts.displayLargeSize,
                  color: LightThemeColors.listTileTitleColor,
                  fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "${Strings.accountCreated.tr}",
             style: TextStyle(
              fontSize: MyFonts.bodyMediumSize,
              color: LightThemeColors.opacityTextColor,
             fontWeight: FontWeight.normal)
              )
            ]
          ),
          textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),

          Center(
              child: CustomButton(
                title: "${Strings.okay.tr}",
                height: 44.h,
                width: 298.w,
                onTap: () {
                  Get.toNamed(AppPages.DashboardView);

                },
              ))
        ],
      ),
    );
  }

}