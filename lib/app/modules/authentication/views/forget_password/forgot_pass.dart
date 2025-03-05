import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/app_Images.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? userPhone;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LogoWithTitle(
        title: 'Forgot Password',
        subText:
            "Forgot your password? No worries! Enter your email or phone number to reset it.",
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  filled: true,
                  fillColor: Color(0xFFF5FCF9),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 16.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onSaved: (phone) {
                    userPhone=phone!;
                  // Save it
                },
                validator: (value) {
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
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Get.toNamed(AppPages.ForgetOtpView,arguments: userPhone);
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: LightThemeColors.primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const StadiumBorder(),
            ),
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}

class LogoWithTitle extends StatelessWidget {
  final String title, subText;
  final List<Widget> children;

  const LogoWithTitle(
      {super.key,
      required this.title,
      this.subText = '',
      required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Image.asset(
                AppImages.instance.manpower_Logo,
                height: 100,
                width: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
                width: double.infinity,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  subText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
                ),
              ),
              ...children,
            ],
          ),
        );
      }),
    );
  }
}
