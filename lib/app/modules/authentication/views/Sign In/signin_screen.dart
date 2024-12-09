import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/components/link_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/app_Images.dart';

class SignInScreen extends BaseView<AuthenticationController> {
  SignInScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
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
                height: MediaQuery.of(context).size.height * 0.04,
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
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: controller.phoneNumberEmailController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                        color: LightThemeColors.primaryColor, width: 2.0),
                  ),
                  hintText: 'Enter Email',
                  suffixIcon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFFF5FCF9),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
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
                    return 'Please enter your email or phone number';
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                controller: controller.passwordController,
                obscureText: controller.obSecurePass.value,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                        color: LightThemeColors.primaryColor, width: 2.0),
                  ),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.obSecurePass.value =
                            !controller.obSecurePass.value;
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: controller.obSecurePass.value
                            ? Colors.grey
                            : LightThemeColors.primaryColor,
                      )),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFFF5FCF9),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                      onPressed: () {
                        _sendOtp();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: LightThemeColors.primaryColor),
                      child: Text(
                        "${Strings.signUp.tr}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
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
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const SocialCard(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const NoAccountText()
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

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            onPressed: () {},
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
              AppImages.instance.googleLogo,
              height: 30,
            ),
            onPressed: () {
            },
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
    Key? key,
  }) : super(key: key);

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
