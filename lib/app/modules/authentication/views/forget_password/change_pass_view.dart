import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/resend_tile.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../utils/app_Images.dart';
import '../../../../components/small_text.dart';
import '../../Auth controller/authentication_controller.dart';

class ChangePasswordAndVerify extends StatefulWidget {
  final String userPhone;

  const ChangePasswordAndVerify({super.key, required this.userPhone});

  @override
  State<ChangePasswordAndVerify> createState() => _ChangePasswordAndVerifyState();
}

class _ChangePasswordAndVerifyState extends State<ChangePasswordAndVerify> {
  Timer? _timer;
  int _start = 30;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _start = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.black,
      //       )),
      //   title: Text(
      //     widget.userPhone,
      //     style: const TextStyle(color: Color(0xFF757575)),
      //   ),
      // ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      SizedBox(
                        child: Image.asset(
                          AppImages.instance.manpower_Logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        SmallText(
                          text: widget.userPhone,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  const Text(
                    "Enter otp",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "We sent your code to ${widget.userPhone} \nThis code will expired in 00:30 second",
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Color(0xFF757575)),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                   PinInputScreen(userPhone: widget.userPhone,),
                  // const OtpForm(),

                  // TextButton(
                  //   onPressed: () {
                  //   },
                  //   child: const Text(
                  //     "Resend OTP Code",
                  //     style: TextStyle(color: Color(0xFF757575)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PinInputScreen extends StatefulWidget {
  final String userPhone;
  const PinInputScreen({super.key,required this.userPhone});

  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _otpPin;
  String? _newPassword;
  bool _obsecureNewPass= true;


  // final List<String?> _pinDigits = List.filled(4, null); // Stores each digit
  //
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Triggers onSaved for all fields
      // String pin = _pinDigits.join(); // Combines digits into full PIN
      // print("User entered PIN: $_otpPin");
      // Navigate to another page (optional)
      Get.toNamed(AppPages.ChangePassword);
    }
  }

  //
  // Widget _buildPinField(int index) {
  //   return SizedBox(
  //     height: 64,
  //     width: 64,
  //     child: TextFormField(
  //       validator: (String? value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Empty';
  //         }
  //         return null;
  //       },
  //       onSaved: (value) {
  //         _pinDigits[index] = value; // Store the digit at correct index
  //       },
  //       onChanged: (value) {
  //         if (value.isNotEmpty) {
  //           FocusScope.of(context).nextFocus(); // Move to the next field
  //         }
  //       },
  //       textInputAction: TextInputAction.next,
  //       keyboardType: TextInputType.number,
  //       inputFormatters: [
  //         LengthLimitingTextInputFormatter(1),
  //         FilteringTextInputFormatter.digitsOnly,
  //       ],
  //       style: Theme.of(context).textTheme.titleLarge,
  //       textAlign: TextAlign.center,
  //       decoration: InputDecoration(
  //         hintText: "0",
  //         hintStyle: const TextStyle(color: Color(0xFF757575)),
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  //         enabledBorder:
  //             OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: const BorderSide(color: Color(0xFFFF7643)),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: List.generate(
        //       4, (index) => _buildPinField(index)), // 4 PIN fields
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: LightThemeColors.primaryColor)),
                    hintText: 'Enter otp',
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // inputFormatters: [
                  //   // LengthLimitingTextInputFormatter(4),
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                  onChanged: (otp) {
                    setState(() {
                      _otpPin=otp;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter otp code';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  obscureText: _obsecureNewPass,
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _obsecureNewPass=!_obsecureNewPass;
                      });
                    }, icon: Icon(!_obsecureNewPass?Icons.remove_red_eye:Icons.remove_red_eye_outlined)),
                    hintText: 'New password',
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0 * 1.5, vertical: 8.0),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: LightThemeColors.primaryColor)),
                  ),
                  onSaved: (newPass) {
                    // _newPassword = newPass!;
                  },
                  onChanged: (newPass) {
                    setState(() {
                      _newPassword = newPass;
                    });
                  },
                  validator: (value) {
                    if(value==null|| value.isEmpty){
                      return "Please enter new password";
                    }else if(value.length<4){
                      return "Password length at least 4 character";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: ' Confirm Password',
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0 * 1.5, vertical: 8.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: LightThemeColors.primaryColor)),
                    ),
                    onSaved: (confirmPass) {
                      // Save it
                    },
                    validator: (value) {
                      if(value==null|| value.isEmpty){
                        return "Please enter new password";
                      }
                      if(value!=_newPassword){
                        return "Password not matched";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResendSmsTile(
                    onTapped: () {
                      Get.find<AuthenticationController>()
                          .otpSendResetPassEmail(phoneOrEmail: widget.userPhone,isRoute: false);
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<AuthenticationController>()
                            .verifyOtpAndResetPass(otp: _otpPin!,newPassword: _newPassword!);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: LightThemeColors.primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Change Password"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamedUntil(AppPages.SignIn, ModalRoute.withName(AppPages.SignIn));
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
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SizedBox(
        //       width: 100,
        //       height: 40,
        //       child: ElevatedButton(
        //         onPressed: _submitForm, // Calls the function to collect PIN
        //         style: ElevatedButton.styleFrom(
        //           elevation: 0,
        //           backgroundColor: LightThemeColors.primaryColor,
        //           foregroundColor: Colors.white,
        //           minimumSize: const Size(double.infinity, 48),
        //           shape: const StadiumBorder(),
        //         ),
        //         child: const Text("Continue"),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
