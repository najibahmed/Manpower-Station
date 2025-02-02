
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/app_Images.dart';

import '../../../components/custom_snackbar.dart';

class UpdatePhoneEmail extends BaseView<UserController> {
  UpdatePhoneEmail({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:const [
            LightThemeColors.primaryColor,LightThemeColors.secondaryColor])
        ),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          centerTitle: true,
          // titleSpacing: -30.0,
          backgroundColor:Colors.transparent,
              // Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
          title: Image.asset(
            AppImages.instance.manpower_Logo,
            fit: BoxFit.cover,
          ),
        ),
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
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text("Change Email or Phone number.",
                  style: TextStyle(fontSize: MyFonts.bodyLargeSize)),
              const SizedBox(
                height: 2,
              ),
              Text("${Strings.getVerification.tr}.",
                  style: TextStyle(
                      fontSize: MyFonts.bodyMediumSize,
                      color: LightThemeColors.opacityTextColor)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.phone,
                controller: controller.oldEmailPhoneController,
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
                    // hintText: 'Your Old email or phone number.',
                    labelText: "Old Email or Phone number",
                    labelStyle:
                        TextStyle(color: LightThemeColors.hintTextColor)),
                // hintStyle: TextStyle(color: LightThemeColors.hintTextColor)),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old phone or email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.phone,
                controller: controller.newEmailPhoneController,
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
                    labelText: "New Email or Phone number",
                    labelStyle:
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
                    return 'Please enter your new phone or email';
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
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                  child: CustomButton(
                title: Strings.signUp.tr,
                height: 38,
                width: 298,
                onTap: () {
                  _sendOtp();
                  // Get.toNamed(AppPages.UpdateOtp);
                },
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendOtp() async {
    if (_formKey.currentState!.validate()) {
      try {
        showLoadingOverLay(
            asyncFunction: controller.updatePhoneOrEmail(), msg: 'Loading');
      } catch (error) {
        CustomSnackBar.showCustomErrorToast(
            message: 'Verify try update email: $error',
            duration: const Duration(seconds: 1));
      }
    }
  }
}
