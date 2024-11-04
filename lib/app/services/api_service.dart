import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:manpower_station/utils/constants.dart';

import '../components/custom_snackbar.dart';
import '../routes/app_pages.dart';

class ApiServices {
  /// Login with email or phone Number
  static Future<void> loginWithPhoneOrEmail(String emailOrPhone) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
      ),
    );
    try {
      Map<String, dynamic> requestData = {
        'phone_or_email': emailOrPhone,
      };
      var response =
          await dio.post("/api/users/sign_in/sign_up", data: requestData);
      if (response.statusCode == 200) {

        if (kDebugMode) {
          print('Success data here------${response.data['success']}');
          print('Message data here------${response.data['message']}');
        }
        Get.snackbar('Success', '${response.data['message']}');
        if (response.data['success'] == true) {
          Get.toNamed(AppPages.OtpScreen);
        } else {
          CustomSnackBar.showCustomErrorSnackBar(
              title: 'Error', message: 'Having problem to send otp');
        }
      }
      // await BaseClient.safeApiCall(
      //   "/api/users/sign_in/sign_up",
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Accept': 'application/json',
      //   },
      //   RequestType.post,
      //   data: requestData,
      //   onSuccess: (response){
      //     if(response.statusCode==200){
      //       // if (kDebugMode) {
      //       //   print('Success data here------${response.data['success']}');
      //       //   print('Message data here------${response.data['message']}');
      //       // }
      //       Get.snackbar('Success','${response.data['message']}');
      //       if(response.data['success'] == true){
      //         Get.toNamed(AppPages.OtpScreen);
      //       }else{
      //         CustomSnackBar.showCustomErrorSnackBar(title: 'Error',message: 'Having problem to send otp');
      //       }
      //     }
      //   },
      // );
    } catch (e) {
      Get.snackbar('Error login :', e.toString());
    }
  }

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

  static Future<void> userReview(
      bookingId, Map<String, dynamic> reviewData) async {
    try {
      var url = '/api/reviews/create/review/$bookingId';
      await BaseClient.safeApiCall(url, RequestType.put,
          //   headers: {
          // 'Authorization': Constants.accessToken
          //   },
          // data: {
          //   "comment": "${data['comment']}",
          //   "rating":data['rating'],
          //   "serviceId": data['serviceId'],
          //   "workerId": data['workerId'],
          // },
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
