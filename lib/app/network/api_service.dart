import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/models/single_worler_model.dart';
import 'package:manpower_station/app/network/api_client.dart';
import 'package:manpower_station/app/network/api_list.dart';
import '../components/custom_snackbar.dart';
import '../modules/service/model/service_list_model.dart';

class ApiServices {
  /// Get one category service
  static Future<List<dynamic>> getOneCategoryServices(String id) async {
    var serviceList = [];
    try {
      var url = ApiList.singleCategoryServiceUrl(id);
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        // if (kDebugMode) {
        //   print(response.data);
        // }
        if (response.statusCode == 200) {
          var jsonData = response.data['servicesLists'];
          serviceList =
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
    return serviceList;
  }

  /// Get Single worker information
  static Future<SingleWorkerModel> getSingleWorker(id) async {
    late SingleWorkerModel workerModel;
    try {
      var url = ApiList.singleWorkerInfoUrl(id);
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        if (response.statusCode == 201) {
          var jsonData = response.data['workerDetailsList']["worker"];
          workerModel = SingleWorkerModel.fromJson(jsonData);
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
  static Future<List<BookingsModel>> changeBookingStatus(String bookingId,Map<String, dynamic> status) async {
        List<BookingsModel> _bookingsList=[];
    try {
      var url = ApiList.changeBookingStatus(bookingId);
      await BaseClient.safeApiCall(url, RequestType.put,
          data: status,
          onSuccess: (response) {
         if (response.statusCode == 201) {
           CustomSnackBar.showCustomSnackBar(
               title: 'Success!',
               message: '${response.data["message"]}');
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

  /// User review
  static Future<void> userReview(
      bookingId, Map<String, dynamic> reviewData) async {
    try {
      var url = ApiList.userReviewUrl(bookingId);
      await BaseClient.safeApiCall(url, RequestType.put, data: reviewData,
          onSuccess: (response) {
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
}
