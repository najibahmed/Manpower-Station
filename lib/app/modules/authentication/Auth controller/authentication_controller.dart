

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/app/services/api_client.dart';
import '../../../core/base/base_controller.dart';

class AuthenticationController extends BaseController {
  TextEditingController phoneNumberEmailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxBool showError = false.obs;
  final RxString errorMessage = ''.obs;
  // final RxBool isOtpWrong= false.obs;



  Future<void> loginWithPhoneOrEmail() async {
    try {
      Map<String, dynamic> requestData = {
        'phone_or_email': phoneNumberEmailController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "http://172.16.154.43/api/users/sign_in/sign_up",
        RequestType.post,
        data: requestData,
        onSuccess: (response){
          if(response.statusCode==201){
            if (kDebugMode) {
              print('Success data here------${response.data['success']}');
              print('Message data here------${response.data['message']}');
            }
            Get.snackbar('Success','${response.data['message']}');
            if(response.data['success'] == true){
              Get.toNamed(AppPages.OtpScreen);
            }else{
              Get.snackbar('Error','Having problem to send otp');
            }
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error :',e.toString());
    }
  }

  Future<void> otpVerification(String pin) async {
    try {
      Map<String, dynamic> requestData = {
        'otp': pin,
      };
      await BaseClient.safeApiCall(
        "http://172.16.154.43/api/users/signup/phone_email/verified",
        RequestType.put,
        data: requestData,
        onError: (p0) {
         var response= p0.response;
          otpController.clear();
          Get.snackbar('Wrong otp',"${response!.data['message']}");
        },
        onSuccess: (response) {
          if (response.statusCode == 200) {
            Map<String,dynamic> responseData = response.data;
            OtpModel otpData= OtpModel.fromJson(responseData);

            print("------->$otpData");

             String accToken=otpData.token!.accesstoken!;
             String refToken=otpData.token!.refreshtoken!;
            MySharedPref.setAccessToken(accToken);
            MySharedPref.setAccessToken(refToken);
            // Success handling (for example, navigate to another screen)
            Get.snackbar('Success', '${otpData.message}');
            Get.offAllNamed(AppPages.DashboardView);
          }else{
            // Handle error
            errorMessage.value = 'Error: ${response.data['message']}';
            Get.snackbar('Error', errorMessage.value);
          }
          if (kDebugMode) {
            print(response.statusCode);
          }
        },
      );
    } catch (e) {
      // Handle other types of errors
      errorMessage.value = 'Something went wrong: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneNumberEmailController;
    nameController;
    otpController;
    super.onClose();
  }
}
