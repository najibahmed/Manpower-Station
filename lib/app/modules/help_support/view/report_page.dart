import 'package:flutter/material.dart';
import 'package:manpower_station/app/components/big_text.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/app_Images.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/custom_snackbar.dart';

class ReportPage extends BaseView<HelpController>{
  const ReportPage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
   return  AppBar(
     // backgroundColor: Colors.white,
     centerTitle: true,
     title: Image.asset(
       'assets/images/manpower_name_logo.png',
       fit: BoxFit.cover,
       color:  controller.isLightMode.value?   Colors.white : LightThemeColors.primaryColor ,
     ),
   );
  }

  @override
  Widget body(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: screenHeight * .02,),
                Text(style: Theme.of(context).textTheme.displayMedium,
                    "If you need any support write it down and our support team will reach you."),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Center(
                  child: Image.asset(
                    AppImages.instance.support,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * .03,),
                TextFormField(
                  controller: controller.userEmailController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Enter Your Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.green, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: 1),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * .02,),
                TextFormField(
                  maxLines: 3,
                  controller: controller.userMessageController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Write a report',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.green, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: 1),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please write you want to report';

                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * .01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: ElevatedButton(onPressed: (){
                        _sendReport();
                      },
                          child:  const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Submit Report",style: TextStyle(color: Colors.white,fontSize: 14),),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  void _sendReport() {
    if (controller.formKey.currentState!.validate()) {
      if (controller.userEmailController.text.trim().isNotEmpty && controller.userMessageController.text.trim().isNotEmpty) {
        try {
          showLoadingOverLay(
              asyncFunction: controller.userReport(),
              msg: 'Loading');
          controller.userEmailController.clear();
          controller.userMessageController.clear();
        } catch (e) {
          CustomSnackBar.showCustomErrorToast(
              message: 'Giving review error: $e',
              duration: const Duration(seconds: 1));
        }
      }
    }}}