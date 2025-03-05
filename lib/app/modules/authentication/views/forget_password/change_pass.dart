import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/utils/app_Images.dart';

class ChangePasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LogoWithTitle(
        title: "Change Password",
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0xFFF5FCF9),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0 * 1.5, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  onSaved: (passaword) {
                    // Save it
                  },
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: ' Confirm Password',
                      filled: true,
                      fillColor: Color(0xFFF5FCF9),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0 * 1.5, vertical: 16.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    onSaved: (passaword) {
                      // Save it
                    },
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFF00BF6D),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const StadiumBorder(),
            ),
            child: const Text("Change Password"),
          ),
          TextButton(
            onPressed: () {
              print("tap");
              CustomSnackBar.showFlutterToast(message: "this is toast message!");
            },
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                children: [
                  TextSpan(
                    text: "Sign in",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
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
      {Key? key,
        required this.title,
        this.subText = '',
        required this.children})
      : super(key: key);
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
                IconButton(onPressed: (){
                  Get.back();
                },
                    icon: Icon(Icons.arrow_back))
              ],),
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
