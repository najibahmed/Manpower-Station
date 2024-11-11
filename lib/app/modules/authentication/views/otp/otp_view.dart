// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../config/theme/my_fonts.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custom_loading_overlay.dart';
import '../../../../core/base/base_view.dart';
import '../../Auth controller/authentication_controller.dart';

class OtpView extends BaseView<AuthenticationController> {
  OtpView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: LightThemeColors.primaryColor,
          )),
      centerTitle: true,
      // titleSpacing: -30.0,
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      title: Image.asset(
        'assets/images/manpower_name_logo.png',
        width: 117,
        height: 34,
        fit: BoxFit.cover,
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget body(BuildContext context) {
    // const length = 4;
    // const borderColor = LightThemeColors.primaryColor;
    // const errorColor = Color.fromRGBO(255, 234, 238, 1);
    // const fillColor = Color.fromRGBO(222, 231, 240, .57);
    // final defaultPinTheme = PinTheme(
    //   width: 56,
    //   height: 60,
    //   textStyle: GoogleFonts.poppins(
    //     fontSize: 22,
    //     color: const Color.fromRGBO(30, 60, 87, 1),
    //   ),
    //   decoration: BoxDecoration(
    //     color: fillColor,
    //     borderRadius: BorderRadius.circular(8),
    //     border: Border.all(color: Colors.transparent),
    //   ),
    // );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
        child: Form(
          key: _formKey,
          child: Center(
              child: SizedBox(
            // height: 68,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/otp_lock.png',
                    width: 124,
                    height: 114,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text("${Strings.verifyNumMsg.tr}",
                    style: TextStyle(fontSize: MyFonts.bodyLargeSize)),
                const SizedBox(
                  height: 2,
                ),
                Text('''${Strings.verificationCodeSent.tr}
                ${controller.phoneNumberEmailController.text}''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MyFonts.bodyMediumSize,
                        color: LightThemeColors.opacityTextColor)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: controller.otpController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: LightThemeColors.primaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: LightThemeColors.opacityTextColor,
                            width: 2.0),
                      ),
                      labelText: "Enter Otp",
                      labelStyle:
                          TextStyle(color: LightThemeColors.hintTextColor)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter  Otp';
                    }
                    return null;
                  },
                ),
                // Pinput(
                //   // autofocus: true,
                //   pinAnimationType: PinAnimationType.slide,
                //   length: length,
                //   controller: controller.otpController,
                //   defaultPinTheme: defaultPinTheme,
                //   // validator: (value) {
                //   //   return controller.isOtpWrong.value ? "Pin is incorrect" : null;
                //   // },
                //   hapticFeedbackType: HapticFeedbackType.lightImpact,
                //   onCompleted: (pin) {
                //     authenticateOtp(pin);
                //   },
                //   // onCompleted: (pin) {
                //   //   print(pin);
                //   //   // controller.showError.value = pin != '5555';
                //   //   // controller.otpVerification();
                //   //   // Get.snackbar("Welcome", "Sucessfully Logged In");
                //   // },
                //   focusedPinTheme: defaultPinTheme.copyWith(
                //     height: 68,
                //     width: 64,
                //     decoration: defaultPinTheme.decoration!.copyWith(
                //       border: Border.all(color: borderColor),
                //     ),
                //   ),
                //   errorPinTheme: defaultPinTheme.copyWith(
                //     decoration: BoxDecoration(
                //       color: errorColor,
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                // ),
                // Text(
                //    "${Strings.enterCode.tr}",
                //   style: TextStyle(
                //       fontSize: MyFonts.bodyMediumSize,
                //       color: LightThemeColors.opacityTextColor),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //       text: "${Strings.dintGetCode.tr}? ",
                //       style: TextStyle(
                //           fontSize: MyFonts.bodyMediumSize,
                //           color: LightThemeColors.bodySmallTextColor),
                //       children: [
                //         TextSpan(
                //             text: 'Resend',
                //             recognizer: TapGestureRecognizer()
                //               ..onTap = () {
                //                 Get.toNamed(AppPages.RegistrationDone);
                //               },
                //             style: const TextStyle(
                //                 decoration: TextDecoration.underline,
                //                 color: LightThemeColors.primaryColor,
                //                 fontWeight: FontWeight.bold)),
                //       ]),
                // ),
                SizedBox(
                  height: 12.h,
                ),
                // ResendSmsTile(),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                    child: CustomButton(
                        title: "Verify",
                        height: 38.h,
                        width: 200.w,
                        onTap: authenticateOtp)),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void authenticateOtp() {
    if (_formKey.currentState!.validate()) {
      showLoadingOverLay(
          asyncFunction: controller.otpVerification(), msg: "Verifying");
      // controller.otpVerification();
    }
  }
}
