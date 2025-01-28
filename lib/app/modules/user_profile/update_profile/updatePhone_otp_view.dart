// ignore_for_file: prefer_const_constructors
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/utils/app_Images.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../config/theme/my_fonts.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../components/custom_snackbar.dart';

class UpdatePhoneOtpView extends BaseView<UserController> {
   UpdatePhoneOtpView({super.key});
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.offNamed(AppPages.UpdateEmailPhone);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: LightThemeColors.primaryColor,
          )),
      centerTitle: true,
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      title: Image.asset(
        AppImages.instance.manpower_Logo,
        width: 117,
        height: 34,
        fit: BoxFit.cover,
      ),
    );
  }
  @override
  Widget body(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
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
                    AppImages.instance.otpVector,
                    width: 124,
                    height: 114,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(Strings.verifyNumMsg.tr,
                    style: TextStyle(fontSize: MyFonts.bodyLargeSize)),
                const SizedBox(
                  height: 2,
                ),
                Text('''${Strings.verificationCodeSent.tr}
                ${controller.newEmailPhoneController.text}''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MyFonts.bodyMediumSize, color: Colors.black54)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: controller.updateOtpController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: LightThemeColors.primaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: LightThemeColors.opacityTextColor, width: 2.0),
                      ),
                      labelText: "Enter Otp",
                      labelStyle: TextStyle(color: LightThemeColors.hintTextColor)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter  Otp';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: LightThemeColors.primaryColor,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                    child: CustomButton(
                  title: "Verify",
                  height: 38.h,
                  width: 200.w,
                  onTap: (){
                    authenticateOtp;
                    Get.offNamed(AppPages.UserProfile,);
                  })),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void authenticateOtp() {
    if(_formKey.currentState!.validate()){
      try {
        controller.updateOtpVerification();
      } catch (e) {
        CustomSnackBar.showCustomErrorToast(
            message: 'Verify otp error: $e',
            duration: const Duration(seconds: 1));
      }
    }
  }
}
