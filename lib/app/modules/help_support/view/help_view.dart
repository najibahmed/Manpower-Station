import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

class HelpView extends BaseView<HelpController> {
  const HelpView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
        centerTitle: true,
        backgroundColor:
            Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
        title: Text(
          'Help & Support',
          style: TextStyle(
            fontSize: MyFonts.appBarTittleSize,
          ),
        ));
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Manpower Station Support!",
            style: TextStyle(
              color: DarkThemeColors.primaryColor,
              fontSize: MyFonts.displayMediumSize,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Our customer help agents are ready to assist you. Please text us \nwith your problem, "
                "complaint or any advice you need.",
            style: TextStyle(
              fontSize: MyFonts.bodySmallTextSize,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            child: Center(
              child: Image.asset(
                'assets/images/help_support.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: ListTile(
              tileColor: Colors.white,
              splashColor: LightThemeColors.primaryColor,
              onTap: (){},
              leading: SizedBox(
                height: 60,
                width: 30,
                child: SvgPicture.asset('assets/vectors/24_help_icon.svg')
              ),
              title: Text('Take Help',style: TextStyle(color: LightThemeColors.primaryColor,fontSize: MyFonts.listTileTitleSize),),
              subtitle: Text('Instant support 24/7',style:TextStyle(color: LightThemeColors.bodyTextColor,fontSize: MyFonts.bodySmallTextSize), ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .03,),
          Material(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            elevation: 5,
            child: ListTile(
              tileColor: Colors.white,
              splashColor: LightThemeColors.primaryColor,
              onTap: (){
                Get.toNamed(AppPages.FaqScreen);
              },
              leading: SizedBox(
                  height: 60,
                  width: 30,
                  child: SvgPicture.asset('assets/vectors/support_icon.svg')
              ),
              title: Text('FAQs',style: TextStyle(color: LightThemeColors.primaryColor,fontSize: MyFonts.listTileTitleSize),),
              subtitle: Text('See frequently asked questions',style:TextStyle(color: LightThemeColors.bodyTextColor,fontSize: MyFonts.bodySmallTextSize), ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
