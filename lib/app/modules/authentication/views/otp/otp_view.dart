
// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/resend_tile.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:pinput/pinput.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../config/theme/my_fonts.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../core/base/base_view.dart';
import '../../Auth controller/authentication_controller.dart';

class OtpView extends BaseView<AuthenticationController> {
  const OtpView({super.key});

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
      backgroundColor: Get.isDarkMode
          ?  DarkThemeColors.backgroundColor:Colors.white,
      title: Image.asset(
        'assets/images/manpower_name_logo.png',
        width: 117,
        height: 34,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    const length = 4;
    const borderColor = LightThemeColors.primaryColor;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
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
            ${controller.phoneNumberEmailController.text?? '+8801XXXXXXXXX'}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: MyFonts.bodyMediumSize,
                    color: LightThemeColors.opacityTextColor)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Pinput(
              // autofocus: true,
              pinAnimationType: PinAnimationType.slide,
              length: length,
              controller: controller.otpController,
              defaultPinTheme: defaultPinTheme,
              // validator: (value) {
              //   return controller.isOtpWrong.value ? "Pin is incorrect" : null;
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                authenticateOtp(pin);
              },
              // onCompleted: (pin) {
              //   print(pin);
              //   // controller.showError.value = pin != '5555';
              //   // controller.otpVerification();
              //   // Get.snackbar("Welcome", "Sucessfully Logged In");
              // },
              focusedPinTheme: defaultPinTheme.copyWith(
                height: 68,
                width: 64,
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: borderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: errorColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
        Text(
           "${Strings.enterCode.tr}",
          style: TextStyle(
              fontSize: MyFonts.bodyMediumSize,
              color: LightThemeColors.opacityTextColor),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "${Strings.dintGetCode.tr}? ",
                  style: TextStyle(
                      fontSize: MyFonts.bodyMediumSize,
                      color: LightThemeColors.bodySmallTextColor),
                  children: [
                    TextSpan(
                        text: 'Resend',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppPages.RegistrationDone);
                          },
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: LightThemeColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          SizedBox(height: 12.h,),
          ResendSmsTile()
          ],
        ),
      )),
    );
  }

  void authenticateOtp(String pin) {
    try{
      controller.otpVerification(pin);
    }catch(e){
      print("Verify otp error: $e");
    }
  }
}
