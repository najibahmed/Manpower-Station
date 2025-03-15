import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/components/small_text.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/app_Images.dart';
import 'package:manpower_station/utils/helper_function.dart';

class SignInScreen extends BaseView<AuthenticationController> {
  SignInScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
    AppBar(
      centerTitle: true,
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      title: Image.asset(
        AppImages.instance.manpower_Logo,
        fit: BoxFit.cover,
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        bool? exitApp = await Get.defaultDialog(
          title: "Exit App",
          middleText: "Are you sure you want to exit?",
          textConfirm: "Yes",
          textCancel: "No",
          onConfirm: () {
            Get.back(); // Close dialog
            if (Platform.isAndroid) {
              SystemNavigator.pop(); // Close app on Android
            } else {
              exit(0); // Close app on iOS & other platforms
            }
          },
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      AppImages.instance.manpower_Logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Center(
                  child: Text("Sign In",
                      style: TextStyle(
                          fontSize: MyFonts.displayLargeSize,
                          fontWeight: FontWeight.bold,
                          color: LightThemeColors.primaryColor)),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.15,
                //   child: Center(
                //     child: Image.asset(
                //       AppImages.instance.registrationVector,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Center(
                  child: Text("Welcome Back",
                      style: TextStyle(fontSize: MyFonts.displayLargeSize)),
                ),
                const SizedBox(
                  height: 2,
                ),
                Center(
                  child: Text("Sign in with your email and password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MyFonts.bodyMediumSize,
                          color: LightThemeColors.opacityTextColor)),
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                emailTextField(context),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                passwordTextField(),
                SizedBox(
                  height: screenHeight * 0.002,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppPages.ForgetPassScreen);
                        },
                        child: SmallText(
                          text: "Forget password?",
                          color: LightThemeColors.primaryColor,
                        ))
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (await HelperFunction.instance
                              .isInternetConnected()) {
                            _sendOtp();
                          } else {
                            CustomSnackBar.showCustomErrorToast(
                                message: " No Internet Connection");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: LightThemeColors.primaryColor),
                        child: Text(
                          "Sign In",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.07,
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
                        "Or Sign in With",
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
                  height: screenHeight * 0.05,
                ),
                const SocialCard(),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                const NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      controller: controller.signInPasswordController,
      obscureText: !controller.obSecurePass.value,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:
              BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
        ),
        hintText: 'Password',
        suffixIcon: IconButton(
            onPressed: () {
              controller.obSecurePass.value = !controller.obSecurePass.value;
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: controller.obSecurePass.value
                  ? LightThemeColors.primaryColor
                  : Colors.grey,
            )),
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: const Color(0xFFE4FAF1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  TextFormField emailTextField(context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        // FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.text,
      controller: controller.signInEmailController,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:
              BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
        ),
        hintText: 'Enter Email',
        suffixIcon: const Icon(
          Icons.mail,
          color: Colors.grey,
        ),
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: const Color(0xFFE4FAF1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your information';
        }

        // Phone Number Validation (Bangladesh)
        String phonePattern = r'^(017|013|014|019|016|018|015)\d{8}$';
        RegExp regExpPhone = RegExp(phonePattern);

        // Email Validation
        String emailPattern =
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        RegExp regExpEmail = RegExp(emailPattern);

        //  if value is a valid phone number
        if (regExpPhone.hasMatch(value)) {
          return null; // It's a valid phone number, no error
        }

        //  if value is a valid email
        if (regExpEmail.hasMatch(value)) {
          return null; // It's a valid email, no error
        }

        return 'Please enter a valid phone number or email address.';
      },
    );
  }

  void _sendOtp()  {
    if (_formKey.currentState!.validate()) {
      _passwordFocusNode.unfocus();
      showLoadingOverLay(asyncFunction: controller.loginUser() , msg: "Loading");
      // await controller.loginUser();
    }
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).hintColor)),
          child: IconButton(
            icon: Image.asset(
              AppImages.instance.appleLogo,
              height: 40,
            ),
            onPressed: () {
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).hintColor)),
            child: IconButton(
              icon: Image.asset(
                AppImages.instance.googleLogo,
                height: 30,
              ),
              onPressed: () {
              },
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
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
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppPages.Registration);
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFFFF7643),
            ),
          ),
        ),
      ],
    );
  }
}
