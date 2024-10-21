

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/app/services/api_client.dart';
import '../../../core/base/base_controller.dart';

class AuthenticationController extends BaseController {
  late TextEditingController phoneNumberEmailController;
  late TextEditingController otpController;
  final RxString errorMessage = ''.obs;



/// Login with email or phone Number
  Future<void> loginWithPhoneOrEmail() async {
    try {
      Map<String, dynamic> requestData = {
        'phone_or_email': phoneNumberEmailController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "/api/users/sign_in/sign_up",
        RequestType.post,
        data: requestData,
        onSuccess: (response){
          if(response.statusCode==200){
            // if (kDebugMode) {
            //   print('Success data here------${response.data['success']}');
            //   print('Message data here------${response.data['message']}');
            // }
            Get.snackbar('Success','${response.data['message']}');
            if(response.data['success'] == true){
              Get.toNamed(AppPages.OtpScreen);
            }else{
              CustomSnackBar.showCustomErrorSnackBar(title: 'Error',message: 'Having problem to send otp');
            }
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error login :',e.toString());
    }
  }
  /// Login with Gmail
  Future<void> loginWithGmail() async {
    try {
    //   Map<String, dynamic> requestData = {
    //     'phone_or_email': phoneNumberEmailController.text.trim(),
    //   };
      await BaseClient.safeApiCall(
        "/api/users/google",
        RequestType.get,
        onSuccess: (response){
          if(response.statusCode==200){
            // if (kDebugMode) {
            //   print('Success data here------${response.data['success']}');
            //   print('Message data here------${response.data['message']}');
            // }
            // if(response.data['success'] == true){
            //   Get.toNamed(AppPages.OtpScreen);
            // }else{
            //   Get.snackbar('Error','Having problem to send otp');
            // }
          }
        },
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title: 'Error Login Gmail:',message: e.toString());
    }
  }

  /// Otp verification
  Future<void> otpVerification() async {
    try {
      Map<String, dynamic> requestData = {
        'otp': otpController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "/api/users/signup/phone_email/verified",
        RequestType.put,
        data: requestData,
        onError: (p0) {
         var response= p0.response;
          otpController.clear();
          CustomSnackBar.showCustomErrorSnackBar(title:" Wrong otp", message: "${response!.data['message']}");
        },
        onSuccess: (response) {
          if (response.statusCode == 200) {
            Map<String,dynamic> responseData = response.data;
            OtpModel otpData= OtpModel.fromJson(responseData);

             String accToken=otpData.token!.accesstoken!;
             String refToken=otpData.token!.refreshtoken!;
             String userId=otpData.user!.id!;
            MySharedPref.setAccessToken(accToken);
            MySharedPref.setRefreshToken(refToken);
            MySharedPref.setUserId(userId as int);
            MySharedPref.setLoginStatus(true);

            // Success handling (for example, navigate to another screen)
            Get.snackbar('Success', '${otpData.message}');
            Get.offAllNamed(AppPages.DashboardView);
          }else{
            // Handle error
            errorMessage.value = 'Error: ${response.data['message']}';
            Get.snackbar('Error otp response', errorMessage.value);
          }
        },
      );
    } catch (e) {
      // Handle other types of errors
      errorMessage.value = 'Something went wrong: $e';
      CustomSnackBar.showCustomErrorSnackBar(title: 'Error otp try',message: errorMessage.value);
    }
  }

  @override
  void onInit() {
    phoneNumberEmailController=TextEditingController();
    otpController=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phoneNumberEmailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
