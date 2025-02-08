import 'package:manpower_station/app/models/bookings_model.dart';

import 'package:manpower_station/app/network/api_client.dart';
import 'package:manpower_station/app/network/api_list.dart';
import '../../utils/appLoggerUtils.dart';
import '../components/custom_snackbar.dart';
import 'package:dio/dio.dart';

import '../data/local/my_shared_pref.dart';

class ApiServices {

  Future<Response<dynamic>> postData(requestData, String appUrl) async {
    late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          appUrl,
          headers: {
            'Content-Type': 'application/json',
            // "Bypass-Auth": "true",
            'Accept': 'application/json',
          },
          RequestType.post,
          data: requestData,
          onError: (err) {
            apiResponse = err.response!;
          },
          onSuccess: (response) {
            apiResponse = response;
          });
    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }


  Future<Response<dynamic>> getData(String appUrl) async {
    late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          appUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          RequestType.get,
          onSuccess: (response) {
            apiResponse = response;
          });
    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }

  Future<Response<dynamic>> putData(requestData, String appUrl) async {
    late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          appUrl,
          headers: {
            'Content-Type': 'application/json',
            "Bypass-Auth": "true",
            'Accept': 'application/json',
          },
          RequestType.put,
          data: requestData, onSuccess: (response) {
        apiResponse = response;
      });
    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Put Data : ${e.toString()}');
    }
    return apiResponse;
  }

  Future<Response> deleteData(String url) async {
    late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          url,
          RequestType.delete,
          onError: (err) {
            apiResponse = err.response!;
          },
          onSuccess: (response) {
            apiResponse = response;
          });
    } catch (e) {
      CustomSnackBar.showCustomErrorToast(
          message: 'Error: $e', duration: const Duration(seconds: 1));
    }
    return apiResponse;
  }

  // /// Get Single worker information
  // static Future<SingleWorkerModel> getSingleWorker(id) async {
  //   late SingleWorkerModel workerModel;
  //   try {
  //     var url = ApiList.singleWorkerInfoUrl(id);
  //     await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
  //       if (response.statusCode == 201) {
  //         var jsonData = response.data['workerDetailsList']["worker"];
  //         workerModel = SingleWorkerModel.fromJson(jsonData);
  //       } else {
  //         CustomSnackBar.showCustomErrorToast(
  //             message: 'Failed to load Worker: ${response.statusMessage}',
  //             duration: const Duration(seconds: 1));
  //       }
  //     });
  //   } catch (e) {
  //     CustomSnackBar.showCustomErrorToast(
  //         message: 'Error: $e', duration: const Duration(seconds: 1));
  //   }
  //   return workerModel;
  // }
  //
  /// User review
  Future<List<BookingsModel>> changeBookingStatus(String bookingId,
      Map<String, dynamic> status) async {
    List<BookingsModel> _bookingsList = [];
    try {
      var url = ApiList.changeBookingStatus(bookingId);
      await BaseClient.safeApiCall(url, RequestType.put, data: status,
          onSuccess: (response) {
            if (response.statusCode == 201) {
              CustomSnackBar.showCustomSnackBar(
                  title: 'Success!', message: '${response.data["message"]}');
              // var jsonData = response.data['bookings'];
              // var bookings = jsonData.map((e) => BookingsModel.fromJson(e)).toList();
              // _bookingsList.assignAll(bookings); // Update the RxList with new data
            } else {
              CustomSnackBar.showCustomErrorSnackBar(
                  title: 'Failed to Change Order Status!',
                  message: '${response.statusMessage}');
            }
          });
    } catch (e) {
      CustomSnackBar.showCustomErrorToast(
          message: 'Error: $e', duration: const Duration(seconds: 1));
    }
    return _bookingsList;
  }

  // /// User review
  // Future<void> userReview(bookingId, Map<String, dynamic> reviewData) async {
  //   try {
  //     var url = ApiList.userReviewUrl(bookingId);
  //     await BaseClient.safeApiCall(url, RequestType.put, data: reviewData,
  //         onSuccess: (response) {
  //           if (response.statusCode == 200) {
  //             var flag = response.data["flag"];
  //             if (flag) {
  //               CustomSnackBar.showCustomSnackBar(
  //                   title: "Successful",
  //                   message: "${response.data["message"]}");
  //             }
  //           } else {
  //             CustomSnackBar.showCustomErrorToast(
  //                 message: 'Failed to give review: ${response.statusMessage}',
  //                 duration: const Duration(seconds: 1));
  //           }
  //         });
  //   } catch (e) {
  //     CustomSnackBar.showCustomErrorToast(
  //         message: 'Error: $e', duration: const Duration(seconds: 1));
  //   }
  // }

  /// user report
  Future<void> userReport(userId, Map<String, dynamic> reviewData) async {
    try {
      var url = ApiList.userReportUrl(userId);
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

  Future<Response<dynamic>> postWithOutData(String appUrl) async {
    late Response<dynamic> apiResponse;
    try {
      await await BaseClient.safeApiCall(
          appUrl,
          RequestType.post,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': MySharedPref.getAccessToken()        //MySharedPref.getAccessToken()
          },
          onError: (err){
            apiResponse= err.response!;
          },
          onSuccess: (response) async {
            apiResponse = response;
          }
      );

    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }

  // Future<void> deleteBookingService(bookingId) async {
  //   try {
  //     var url = ApiList.deleteUserBooking(bookingId);
  //     await BaseClient.safeApiCall(url, RequestType.delete,
  //         onSuccess: (response) {
  //           if (response.statusCode == 200) {
  //             CustomSnackBar.showCustomSnackBar(
  //                 title: "Successful", message: "${response.data["message"]}");
  //           } else {
  //             CustomSnackBar.showCustomErrorToast(
  //                 message: 'Failed to Delete Service: ${response
  //                     .statusMessage}',
  //                 duration: const Duration(seconds: 1));
  //           }
  //         });
  //   } catch (e) {
  //     CustomSnackBar.showCustomErrorToast(
  //         message: 'Error: $e', duration: const Duration(seconds: 1));
  //   }
  // }
}