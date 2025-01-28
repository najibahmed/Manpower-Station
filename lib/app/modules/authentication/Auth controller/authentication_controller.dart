// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/modules/authentication/auth_repository/auth_repo.dart';
import 'package:manpower_station/app/network/api_list.dart';
import '../../../core/base/base_controller.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../views/otp/otp_model.dart';

class AuthenticationController extends BaseController {

  late TextEditingController signInEmailController;
  late TextEditingController signUpEmailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController signInPasswordController;
  late TextEditingController nameController;
  late TextEditingController otpController;
  RxBool obSecurePass = RxBool(false);


  Future<void> registerUser()async {
    Map<String, dynamic> requestData = {
      'username': nameController.text.trim(),
      'phone': phoneNumberController.text.trim(),
      'email': signUpEmailController.text.trim(),
      'password': passwordController.text.trim(),
    };
   var response =  await AuthRepository.postData(requestData, ApiList.userRegistrationUrl);
   if(response.statusCode==201){
     Get.snackbar(' Registration Success','${response.data['message']}');
     if(response.data['success']==true){
       Get.toNamed(AppPages.OtpScreen);
     }
   }else{
     CustomSnackBar.showCustomErrorSnackBar(title: 'Error Registration ',message: '${response.data['message']}!',color: Colors.redAccent);
   }

  }

  Future<void> verifyUserOtp()async {
    Map<String, dynamic> requestData = {
      'otp': otpController.text.trim(),
    };
    var response =  await AuthRepository.putData(requestData, ApiList.userOtpVerificationUrl);
    if(response.statusCode==200){
      Map<String, dynamic> responseData = response.data;
      OtpModel otpData = OtpModel.fromJson(responseData);
      String accToken = otpData.token!.accesstoken!;
      String refToken = otpData.token!.refreshtoken!;
      String userId = otpData.user!.id!;
      MySharedPref.setAccessToken(accToken);
      MySharedPref.setRefreshToken(refToken);
      MySharedPref.setUserId(userId);
      MySharedPref.setLoginStatus(true);
      // Success handling (for example, navigate to another screen)
      Get.snackbar('Success', '${otpData.message}');
      Get.offAllNamed(AppPages.DashboardView);
    }else{
      CustomSnackBar.showCustomErrorSnackBar(title: 'Error Otp ',message: 'Check!',color: Colors.redAccent);
    }
  }

  Future<void> loginUser() async{
    Map<String, dynamic> requestData = {
      'phone_or_email': signInEmailController.text.trim(),
      'password': signInPasswordController.text.trim(),
    };
    var response =  await AuthRepository.postLogin(requestData, ApiList.userLoginUrl);

    if(response.statusCode==200){
      Map<String, dynamic> responseData = response.data;
      OtpModel otpData = OtpModel.fromJson(responseData);
      // Set User Data to local storage
       setUserInfo(otpData);
      // Success handling
      Get.snackbar('Successfully Logged In', '${otpData.message}');
      Get.offAllNamed(AppPages.DashboardView);
    }else if(response.statusCode==400){
      CustomSnackBar.showCustomErrorSnackBar(title: 'Error Registration ',message: '${response.data['message']}!',color: Colors.redAccent);
    }else{
      CustomSnackBar.showCustomErrorSnackBar(title: 'Error Registration ',message: 'Bad Request',color: Colors.redAccent);
    }
  }

  void setUserInfo(OtpModel otpData){
    String accToken = otpData.token!.accesstoken!;
    String refToken = otpData.token!.refreshtoken!;
    String userId = otpData.user!.id!;
    MySharedPref.setAccessToken(accToken);
    MySharedPref.setRefreshToken(refToken);
    MySharedPref.setUserId(userId);
    MySharedPref.setLoginStatus(true);
  }


  @override
  void onInit() {
    signUpEmailController = TextEditingController();
    signInEmailController = TextEditingController();
    phoneNumberController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    signInPasswordController = TextEditingController();
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    signInEmailController.dispose();
    signUpEmailController.dispose();
    phoneNumberController.dispose();
    nameController.dispose();
    passwordController.dispose();
    signInPasswordController.dispose();
    otpController.dispose();
    super.onClose();
  }


// /// Login with email or phone Number
//   Future<void> loginWithPhoneOrEmail() async {
//     try {
//       Map<String, dynamic> requestData = {
//         'phone_or_email': phoneNumberEmailController.text.trim(),
//       };
//       await BaseClient.safeApiCall(
//         "/api/users/sign_in/sign_up",
//         RequestType.post,
//         data: requestData,
//         onSuccess: (response) {
//           if (response.statusCode == 201) {
//             // if (kDebugMode) {
//             //   print('Success data here------${response.data['success']}');
//             //   print('Message data here------${response.data['message']}');
//             // }
//             Get.snackbar('Success', '${response.data['message']}');
//             if (response.data['success']) {
//               Get.toNamed(AppPages.OtpScreen);
//             } else {
//               CustomSnackBar.showCustomErrorSnackBar(
//                   title: 'Error', message: 'Having problem to send otp');
//             }
//           }
//         },
//       );
//     } catch (e) {
//       Get.snackbar('Error login :', e.toString());
//     }
//   }

  /// Login with Gmail
  // Future<void> loginWithGmail() async {
  //   try {
  //     //   Map<String, dynamic> requestData = {
  //     //     'phone_or_email': phoneNumberEmailController.text.trim(),
  //     //   };
  //     await BaseClient.safeApiCall(
  //       "/api/users/google",
  //       RequestType.get,
  //       onSuccess: (response) {
  //         if (response.statusCode == 200) {
  //           // if (kDebugMode) {
  //           //   print('Success data here------${response.data['success']}');
  //           //   print('Message data here------${response.data['message']}');
  //           // }
  //           // if(response.data['success'] == true){
  //           //   Get.toNamed(AppPages.OtpScreen);
  //           // }else{
  //           //   Get.snackbar('Error','Having problem to send otp');
  //           // }
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     CustomSnackBar.showCustomErrorSnackBar(
  //         title: 'Error Login Gmail:', message: e.toString());
  //   }
  // }

/// Otp verification
// Future<void> otpVerification() async {
//   try {
//     Map<String, dynamic> requestData = {
//       'otp': otpController.text.trim(),
//     };
//     await BaseClient.safeApiCall(
//       "/api/users/signup/phone_email/verified",
//       RequestType.put,
//       data: requestData,
//       onError: (p0) {
//         var response = p0.response;
//         otpController.clear();
//         CustomSnackBar.showCustomErrorSnackBar(
//             title: " Wrong otp", message: "${response!.data['message']}");
//       },
//       onSuccess: (response) {
//         if (response.statusCode == 200) {
//           Map<String, dynamic> responseData = response.data;
//           OtpModel otpData = OtpModel.fromJson(responseData);
//           String accToken = otpData.token!.accesstoken!;
//           String refToken = otpData.token!.refreshtoken!;
//           String userId = otpData.user!.id!;
//           MySharedPref.setAccessToken(accToken);
//           MySharedPref.setRefreshToken(refToken);
//           MySharedPref.setUserId(userId);
//           MySharedPref.setLoginStatus(true);
//
//           // Success handling (for example, navigate to another screen)
//           Get.snackbar('Success', '${otpData.message}');
//           Get.offAllNamed(AppPages.DashboardView);
//         } else {
//           // Handle error
//           // errorMessage.value = 'Error: ${response.data['message']}';
//           Get.snackbar('Error otp response', errorMessage.value);
//         }
//       },
//     );
//   } catch (e) {
//     // Handle other types of errors
//     errorMessage.value = 'Something went wrong: $e';
//     CustomSnackBar.showCustomErrorSnackBar(
//         title: 'Error otp try', message: errorMessage.value);
//   }
// }
}
