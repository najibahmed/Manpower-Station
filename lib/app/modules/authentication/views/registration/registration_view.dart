// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/components/link_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/app_Images.dart';

import '../../../../routes/app_pages.dart';

class RegistrationView extends BaseView<AuthenticationController> {
  RegistrationView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Image.asset(AppImages.instance.manpower_Logo),
              ),
              Center(
                child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: MyFonts.displayLargeSize,
                        fontWeight: FontWeight.bold,
                        color: LightThemeColors.primaryColor)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Text("${Strings.registerAccount.tr}",
                    style: TextStyle(fontSize: MyFonts.displayLargeSize)),
              ),
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Text("${Strings.getVerification.tr}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MyFonts.bodyMediumSize,
                        color: LightThemeColors.opacityTextColor)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              nameTextField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              emailTextField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              phoneNumberTextField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              passTextField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              termsAndConditionTextSection(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              signUpButton(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
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
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const SocialCard(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const AlreadyAccountText()
            ],
          ),
        ),
      ),
    );
  }

  Row termsAndConditionTextSection() {
    return Row(
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
            );
  }

  Center signUpButton(BuildContext context) {
    return Center(
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
            );
  }

  TextFormField passTextField() {
    return TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: LightThemeColors.primaryColor, width: 2.0),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                suffixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                fillColor: const Color(0xFFE4FAF1),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0 * 1.5, vertical: 16.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password!';
                }
                return null;
              },
            );
  }

  TextFormField phoneNumberTextField() {
    return TextFormField(
              // autofocus: true,
              maxLength: 11,
              keyboardType: TextInputType.text,
              controller: controller.phoneNumberController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: LightThemeColors.primaryColor, width: 2.0),
                ),
                hintText: 'Enter Phone number',
                hintStyle: TextStyle(color: Colors.grey[600]),
                suffixIcon: const Icon(
                  Icons.phone_android_outlined,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: const Color(0xFFE4FAF1),
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
                // Create the regex object.
                RegExp regExp = RegExp(phonePattern);
                // Check if the input is null or empty.
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!regExp.hasMatch(value)) {
                  return 'Please enter a valid phone number.';
                }
                return null;
              },
            );
  }

  TextFormField emailTextField() {
    return TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              controller: controller.signUpEmailController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: LightThemeColors.primaryColor, width: 2.0),
                ),
                hintText: 'Enter Email',
                hintStyle: TextStyle(color: Colors.grey[600]),
                suffixIcon: const Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: const Color(0xFFE4FAF1),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0 * 1.5, vertical: 16.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              validator: (String? value) {
                String emailPattern =
                    r'^[a-z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                // Create the regex object.
                RegExp regExpEmail = RegExp(emailPattern);
                // Check if the input is null or empty.
                if (value == null || value.isEmpty) {
                  return 'Please enter your Email';
                }
                if (!regExpEmail.hasMatch(value)) {
                  // Validate the input using the regex.
                  return 'Please enter a valid Email Address';
                }
                return null;
              },
            );
  }

  TextFormField nameTextField() {
    return TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: LightThemeColors.primaryColor, width: 2.0),
                ),
                hintText: 'Full Name',
                suffixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: const Color(0xFFE4FAF1),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0 * 1.5, vertical: 16.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full Name';
                }
                return null;
              },
            );
  }

  void _sendOtp() async {
    if (_formKey.currentState!.validate()) {
      showLoadingOverLay(asyncFunction: controller.registerUser(), msg: "Loading");
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
            onPressed: () {},
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
              onPressed: () {},
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

class AlreadyAccountText extends StatelessWidget {
  const AlreadyAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppPages.SignIn);
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: Color(0xFFFF7643),
            ),
          ),
        ),
      ],
    );
  }
}
