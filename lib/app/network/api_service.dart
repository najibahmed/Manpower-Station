import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/network/api_client.dart';
import '../components/custom_snackbar.dart';
import '../data/local/my_shared_pref.dart';
import '../modules/authentication/views/otp/otp_model.dart';
import '../modules/service/model/service_list_model.dart';
import '../routes/app_pages.dart';

class ApiServices {

  /// Login with email or phone Number
  static Future<void> loginWithPhoneOrEmail(String emailOrPhone) async {
    try {
      Map<String, dynamic> requestData = {
        'phone_or_email': emailOrPhone,
      };

      await BaseClient.safeApiCall(
        "/api/users/sign_in/sign_up",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        RequestType.post,
        data: requestData,
        onSuccess: (response){
          if(response.statusCode==200){
            if (kDebugMode) {
              print('Success data here------${response.data['success']}');
              print('Message data here------${response.data['message']}');
            }
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
      Get.snackbar('Error login :', e.toString());
    }
  }
  /// Verify user using opt verification
  static Future<void> otpVerification(otpData) async {
    try {
      Map<String, dynamic> requestData = {
        'otp': otpData,
      };
      await BaseClient.safeApiCall(
        "/api/users/signup/phone_email/verified",
        RequestType.put,
        data: requestData,
        onError: (p0) {
          var response = p0.response;
          CustomSnackBar.showCustomErrorSnackBar(
              title: " Wrong otp", message: "${response!.data['message']}");
        },
        onSuccess: (response) {
          if (response.statusCode == 200) {
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
          } else {
            if(kDebugMode){
              Get.snackbar('Error otp response', "status code error");
            }
          }
        },
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Error otp try', message: e.toString());
    }
  }


  /// Get one category service
  static Future<List<dynamic>> getOneCategoryServices(String id) async {
    var _serviceList=[];
    try {
      var url = "/api/services/categories/services/$id";
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        // if (kDebugMode) {
        //   print(response.data);
        // }
        if (response.statusCode == 200) {
          var jsonData = response.data['servicesLists'];
          _serviceList =
              jsonData.map((item) => ServiceModel.fromJson(item)).toList();
        } else {
          CustomSnackBar.showCustomErrorSnackBar(
              title: 'Failed to load services by one category:',
              message: ' ${response.statusMessage}');
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Error try get all service cat:', message: '$e');
    }
    return _serviceList;
  }

/// Get Single worker information
  static Future<WorkerModel> getSingleWorker(id) async {
    late WorkerModel workerModel;
    try {
      var url = '/api/workers/get/unique/worker/profile/$id';
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        if (response.statusCode == 201) {
          var jsonData = response.data['worker'];
          workerModel = WorkerModel.fromJson(jsonData);
        } else {
          CustomSnackBar.showCustomErrorToast(
              message: 'Failed to load Worker: ${response.statusMessage}',
              duration: const Duration(seconds: 1));
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorToast(
          message: 'Error: $e', duration: const Duration(seconds: 1));
    }
    return workerModel;
  }

  /// User review
  static Future<void> userReview(
      bookingId, Map<String, dynamic> reviewData) async {
    try {
      var url = '/api/reviews/create/review/$bookingId';
      await BaseClient.safeApiCall(url, RequestType.put,
          data: reviewData, onSuccess: (response) {
        if (response.statusCode == 200) {
          var flag = response.data["flag"];
          if (flag) {
            CustomSnackBar.showCustomSnackBar(
                title: "Successful", message: "${response.data["message"]}");
          }
        } else {
          CustomSnackBar.showCustomErrorToast(
              message: 'Failed to give review: ${response.statusMessage}',
              duration: const Duration(seconds: 1));
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorToast(
          message: 'Error: $e', duration: const Duration(seconds: 1));
    }
  }
/// user report
  static Future<void> userReport(
      userId, Map<String, dynamic> reviewData) async {
    try {
      var url = '/api/contracts/client/send/$userId';
      await BaseClient.safeApiCall(url, RequestType.post,
          //   headers: {
          // 'Authorization': Constants.accessToken
          //   },
          data: reviewData, onSuccess: (response) {
        if (response.statusCode == 200) {
          var flag = response.data["flag"];
          if (flag) {
            CustomSnackBar.showCustomSnackBar(
                title: "Done", message: "${response.data["message"]}");
          }
        } else {
          CustomSnackBar.showCustomErrorToast(
              message: 'Failed to give report: ${response.statusMessage}',
              duration: const Duration(seconds: 1));
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorToast(
          message: 'Error: $e', duration: const Duration(seconds: 1));
    }
  }
}
