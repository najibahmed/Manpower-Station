import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/models/single_worler_model.dart';
import 'package:manpower_station/app/network/api_list.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../network/api_client.dart';
import '../../../network/api_service.dart';
class BookingsController extends BaseController
    with GetTickerProviderStateMixin {
  final ApiServices apiService;

  BookingsController({required this.apiService});

  // late TabController tabController;
  // RxInt tabIndex = 0.obs;
  final RxList _bookingsList = <dynamic>[].obs;

  List get getBookingList => _bookingsList;
  RxDouble userRating = 1.0.obs;
  RxBool isLoading = true.obs;
  FocusNode focusNode = FocusNode();
  RxBool refreshLoading = false.obs;
  TextEditingController reviewController = TextEditingController();
  Rx<SingleWorkerModel?> workersData = SingleWorkerModel().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getWorkerInformation(String id) async {
    var url = ApiList.singleWorkerInfoUrl(id);
    var response = await apiService.getData(url);
    if (response.statusCode == 201) {
      var jsonData = response.data['workerDetailsList']["worker"];
      SingleWorkerModel workerModel = SingleWorkerModel.fromJson(jsonData);
      workersData.value = workerModel;
    } else {
      CustomSnackBar.showCustomErrorToast(
          message: 'Failed to load Worker: ${response.statusMessage}',
          duration: const Duration(seconds: 1));
    }
  }

  Future<void> deleteBookingService(String bookingId) async {
    List<BookingsModel>? bookings = await MySharedPref.getUserBookings();
    var url = ApiList.deleteUserBooking(bookingId);
    var response = await apiService.deleteData(url);
    if (response.statusCode == 200) {
      var temp = bookings.where((booking) => booking.id != bookingId).toList();
      await MySharedPref.saveUserBookings(temp);
      _loadUserBookings();
      Get.back();
      CustomSnackBar.showCustomSnackBar(
          title: "Successful", message: "${response.data["message"]}");
    } else {
      CustomSnackBar.showCustomErrorToast(
          message: 'Failed to Delete Service: ${response.statusMessage}',
          duration: const Duration(seconds: 1));
    }

  }

  /// Give user review
  Future<void> giveUserReview(serviceId, String? bookingId) async {
    Map<String, dynamic> requestData = {
      "comment": "${reviewController.text.trim()}",
      "rating": "${userRating}",
      "serviceId": ["$serviceId"],
      "workerId": ["${workersData.value!.user!.id}"],
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
    print(requestData);
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

 /// Change order status
  Future<void> changeOrderStatus(String? bookingId, String status) async {
    Map<String, dynamic> statusData = {
      "paymentStatus": status,
    };
    await apiService.changeBookingStatus(bookingId!, statusData);
    await getAllBookingsByUid();
    _loadUserBookings();
  }

  // void changeTabIndex(int index) {
  //   tabIndex.value = index;
  // }

  void _loadUserBookings() async {
    List<BookingsModel>? bookings = await MySharedPref.getUserBookings();
    if (bookings.isNotEmpty) {
      _bookingsList.assignAll(bookings);
    }
  }

  @override
  void onInit() async {
    await getAllBookingsByUid();
    _loadUserBookings();
    // tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // tabController.dispose();
    reviewController.dispose();
    super.onClose();
  }

  /// get all bookings for particular userId
  Future<void> getAllBookingsByUid() async {
    String? userId = await MySharedPref.getUserId();
    try {
      var url = ApiList.getBookingsByUidUrl(userId!);
      await BaseClient.safeApiCall(url, RequestType.get, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': MySharedPref.getAccessToken()
      }, onSuccess: (response) async {
        if (response.statusCode == 201) {
          var jsonData = response.data['bookings'];
          var bookings =
              jsonData.map((e) => BookingsModel.fromJson(e)).toList();
          //save user bookings to local storage
          await MySharedPref.saveUserBookings(bookings);
          _loadUserBookings();
        } else {
          CustomSnackBar.showCustomErrorSnackBar(
              title: 'Failed to load Workers:',
              message: '${response.statusMessage}');
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title: 'Error bookings :', message: e.toString());
    }
  }
}

enum ServiceStatus { Confirmed, Cancelled }
