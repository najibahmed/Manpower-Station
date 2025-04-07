import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import '../../../components/custom_snackbar.dart';
import '../../../core/base/base_controller.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../models/bookings_model.dart';
import '../../../models/single_worler_model.dart';
import '../../../network/api_list.dart';
import '../../../network/api_service.dart';

class BookingDetailsController extends BaseController {
  final ApiServices apiService;

  BookingDetailsController({required this.apiService});
  List<SingleWorkerModel?> workersData=<SingleWorkerModel?>[].obs;
  late BookingsModel booking;
  late List workerList;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxDouble userRating = 1.0.obs;
  FocusNode focusNode = FocusNode();
  TextEditingController reviewController = TextEditingController();

  @override
  void onInit() {
    booking = Get.arguments[0];
    workerList = Get.arguments[1];
    // workerList.map((worker) {
    //   print("${worker.user}");
    //   getWorkerInformation(worker.user);
    // });
    getWorkerInformation(workerList.firstOrNull.user);

    super.onInit();
  }

  Future<void> getWorkerInformation(String id) async {
    var url = ApiList.singleWorkerInfoUrl(id);
    var response = await apiService.getData(url);
    if (response.statusCode == 201) {
      var jsonData = response.data['workerDetailsList']["worker"];
      SingleWorkerModel workerModel = SingleWorkerModel.fromJson(jsonData);
      workersData.assign(workerModel);
    } else {
      CustomSnackBar.showCustomErrorToast(
          message: 'Failed to load Worker: ${response.statusMessage}',
          duration: const Duration(seconds: 1));
    }
  }


  /// Give user review
  Future<void> giveUserReview(serviceId, String? bookingId) async {
    Map<String, dynamic> requestData = {
      "comment": "${reviewController.text.trim()}",
      "rating": "${userRating}",
      "serviceId": ["$serviceId"],
      "workerId": ["${workersData.first!.user!.id}"],
    };
    var url = ApiList.userReviewUrl(bookingId!);
    var response = await apiService.putData(requestData, url);
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
  }

  /// Change order status
  Future<void> changeOrderStatus(String? bookingId, String status) async {
    Map<String, dynamic> statusData = {
      "paymentStatus": status,
    };
    await apiService.changeBookingStatus(bookingId!, statusData);
    await Get.find<BookingsController>().getAllBookingsByUid();
    Get.find<BookingsController>().loadUserBookings();
  }

  Future<void> deleteBookingService(String bookingId) async {
    List<BookingsModel>? bookings = await MySharedPref.getUserBookings();
    var url = ApiList.deleteUserBooking(bookingId);
    var response = await apiService.deleteData(url);
    if (response.statusCode == 200) {
      var temp = bookings.where((booking) => booking.id != bookingId).toList();
      await MySharedPref.saveUserBookings(temp);
      Get.find<BookingsController>().loadUserBookings();
      Get.back();
      CustomSnackBar.showCustomSnackBar(
          title: "Successful", message: "${response.data["message"]}");
    } else {
      CustomSnackBar.showCustomErrorToast(
          message: 'Failed to Delete Service: ${response.statusMessage}',
          duration: const Duration(seconds: 1));
    }

  }

  /// pay due  amount
  Future<void> payDueAmount({
    required String amount,
    required String bookingId,
    required String clientName,
    required String clientPhone,
    required String clientArea,
    required String clientState,
    required String clientCity,
    required String clientAddress,
  }
      ) async {
    Map<String, dynamic> requestData = {
      'amount': amount,
      'BookingId': bookingId,
      'addressInfo': {
        'name': clientName,
        'phone': clientPhone,
        'area': clientArea,
        'state': clientState,
        'city': clientCity,
        'address': clientAddress,
      },
      'app': 'ammerpay-app'
    };
    // var response= await apiService.postData(requestData, ApiList.userOrderCreateUrl);
    // if (response.statusCode == 200) {
    //       print("pay due  response data----->${response.data}");
    //
    // } else {
    //   CustomSnackBar.showCustomErrorSnackBar(
    //       title: 'Failed to payment Order',
    //       message: '${response.statusMessage}');
    // }
  }
}
