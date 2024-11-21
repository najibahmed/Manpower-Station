// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/components/link_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/app_Images.dart';

class RegistrationView extends BaseView<AuthenticationController> {
  RegistrationView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      centerTitle: true,
      // titleSpacing: -30.0,
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      title: Image.asset(
        'assets/images/manpower_name_logo.png',
        fit: BoxFit.cover,
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Image.asset(
                  AppImages.instance.registrationVector,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text("${Strings.enterEmailPhnNum.tr}",
                  style: TextStyle(fontSize: MyFonts.displayMediumSize)),
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Text("${Strings.getVerification.tr}",
                    style: TextStyle(
                        fontSize: MyFonts.bodyMediumSize,
                        color: LightThemeColors.opacityTextColor)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.text,
                controller: controller.phoneNumberEmailController,
                decoration: const InputDecoration(
                    // prefixIcon: Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Container(
                    //     width: 70,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [Icon(Icons.flag_outlined), Text(' +88  |')],
                    //     ),
                    //   ),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: LightThemeColors.primaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      borderSide: BorderSide(
                          color: LightThemeColors.opacityTextColor, width: 2.0),
                    ),
                    labelText: "Enter Email or Phone Number",
                    labelStyle: TextStyle(color: LightThemeColors.hintTextColor),
                    hintText: '01********** or abc@gmail.com',
                    hintStyle:
                        TextStyle(color: LightThemeColors.hintTextColor)),
                validator: (String? value) {
                  // Define the regex pattern for the allowed prefixes and 11 digits.
                  String phonePattern = r'^(017|013|014|019|016|018|015)\d{8}$';
                  String emailPattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  // Create the regex object.
                  RegExp regExpEmail = RegExp(emailPattern);
                  RegExp regExp = RegExp(phonePattern);
                  // Check if the input is null or empty.
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.isEmail) {
                    // Validate the input using the regex.
                    if (!regExpEmail.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                  } else if (value.isPhoneNumber) {
                    // Validate the input using the regex.
                    if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid phone number.';
                    }
                  } else {
                    return 'Please enter a valid credential.';
                  }
                  // If the input is valid, return null (no error).
                  return null;
                },
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
                        text: '${Strings.acceptTermMsg.tr}',
                        style: TextStyle(
                            color: LightThemeColors.opacityTextColor,
                            fontSize: MyFonts.bodyMediumSize),
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: LinkButton(
                                urlLabel: " ${Strings.termsAndCondition.tr}",
                                url:
                                    "https://example.com/terms-and-conditions"),
                          ),
                          TextSpan(
                            text: ' ${Strings.and.tr} ',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: LinkButton(
                                urlLabel: "${Strings.privacyPolicy.tr}.",
                                url: "https://example.com/privacy-policy"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        _sendOtp();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                          backgroundColor: Colors.orange),
                      child: Text(
                        "${Strings.sendOtp.tr}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Or Sign Up With",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color:Theme.of(context).hintColor)),
                    child: IconButton(
                      icon: Image.asset(
                        AppImages.instance.appleLogo,
                        height: 40,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: IconButton(
                      icon: Image.asset(
                        AppImages.instance.googleLogo,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: IconButton(
                      icon: Image.asset(
                        AppImages.instance.facebookLogo,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: 260,
              //         child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(8)),
              //                 backgroundColor: Colors.white,
              //                 elevation: 5),
              //             onPressed: () {},
              //             child: Padding(
              //               padding:
              //                   const EdgeInsets.symmetric(horizontal: 8.0),
              //               child: Row(
              //                 children: [
              //                   SizedBox(
              //                     height: 30,
              //                     width: 30,
              //                     child: Image.asset(
              //                       AppImages.instance.googleLogo,
              //                       fit: BoxFit.fill,
              //                     ),
              //                   ),
              //                   const SizedBox(
              //                     width: 20,
              //                   ),
              //                   const Text(
              //                     'Continue with Google',
              //                     style: TextStyle(
              //                         color: Colors.black54,
              //                         fontWeight: FontWeight.w400),
              //                   )
              //                 ],
              //               ),
              //             )),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendOtp() async {
    if (_formKey.currentState!.validate()) {
      showLoadingOverLay(
          asyncFunction: controller.loginWithPhoneOrEmail(), msg: "Loading");
      // await controller.loginWithPhoneOrEmail();
    }
  }
}
