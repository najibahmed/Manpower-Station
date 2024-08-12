import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/link_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';


class RegistrationView extends BaseView<AuthenticationController> {
  RegistrationView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      centerTitle: false,
      // titleSpacing: -30.0,
      backgroundColor: Get.isDarkMode
          ?  DarkThemeColors.backgroundColor:Colors.white,
      title: Image.asset(
        'assets/images/manpower_name_logo.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            child: Center(
              child: Image.asset(
                'assets/images/registration_vactor.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Text("Enter Your Phone Number",
              style: TextStyle(fontSize: MyFonts.bodyLargeSize)),
          SizedBox(
            height: 2,
          ),
          Text("You will get 6-digit verification code.",
              style: TextStyle(
                  fontSize: MyFonts.bodyMediumSize,
                  color: LightThemeColors.opacityTextColor)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextFormField(
            // autofocus: true,
            keyboardType: TextInputType.phone,
            controller: controller.phoneNumberController,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Icon(Icons.flag_outlined), Text(' +88  |')],
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: LightThemeColors.primaryColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: LightThemeColors.opacityTextColor, width: 2.0),
                ),
                hintText: '01**********',
                hintStyle: TextStyle(color: LightThemeColors.hintTextColor)),
            validator: (String? value) {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            children: [
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By entering your phone number, you agree to our',
                    style: TextStyle(
                        color: LightThemeColors.opacityTextColor,
                        fontSize: MyFonts.bodyMediumSize),
                    children: const <InlineSpan>[
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: LinkButton(
                            urlLabel: "Terms and Conditions",
                            url: "https://example.com/terms-and-conditions"),
                      ),
                      TextSpan(
                        text: ' and ',
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: LinkButton(
                            urlLabel: "Privacy Policy.",
                            url: "https://example.com/privacy-policy"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
              child: CustomButton(
            title: "Send OTP",
            height: 44,
            width: 298,
            onTap: () {
              Get.toNamed(AppPages.OtpScreen);
            },
          ))
        ],
      ),
    );
  }
}
