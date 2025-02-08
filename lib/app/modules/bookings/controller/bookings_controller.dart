import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/bookings_model.dart';

import 'package:manpower_station/app/network/api_list.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../network/api_client.dart';
import '../../../network/api_service.dart';
import '../../../routes/app_pages.dart';
class BookingsController extends BaseController
    with GetTickerProviderStateMixin {
  final ApiServices apiService;

  BookingsController({required this.apiService});

  // late TabController tabController;
  // RxInt tabIndex = 0.obs;
  // TextEditingController reviewController = TextEditingController();
  // Rx<SingleWorkerModel?> workersData = SingleWorkerModel().obs;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // FocusNode focusNode = FocusNode();

  final RxList _bookingsList = <dynamic>[].obs;
  RxString _transactionId=''.obs;
  String get transactionId =>_transactionId.value;
  List get getBookingList => _bookingsList;
  RxDouble userRating = 1.0.obs;
  RxBool isLoading = false.obs;
  RxBool refreshLoading = false.obs;
  Rx<BookingsModel?> bookings = BookingsModel().obs;

  // Future<void> getWorkerInformation(String id) async {
  //   var url = ApiList.singleWorkerInfoUrl(id);
  //   var response = await apiService.getData(url);
  //   if (response.statusCode == 201) {
  //     var jsonData = response.data['workerDetailsList']["worker"];
  //     SingleWorkerModel workerModel = SingleWorkerModel.fromJson(jsonData);
  //     workersData.value = workerModel;
  //   } else {
  //     CustomSnackBar.showCustomErrorToast(
  //         message: 'Failed to load Worker: ${response.statusMessage}',
  //         duration: const Duration(seconds: 1));
  //   }
  // }

  Future<void> deleteBookingService(String bookingId) async {
    List<BookingsModel>? bookings = await MySharedPref.getUserBookings();
    var url = ApiList.deleteUserBooking(bookingId);
    var response = await apiService.deleteData(url);
    if (response.statusCode == 200) {
      var temp = bookings.where((booking) => booking.id != bookingId).toList();
      await MySharedPref.saveUserBookings(temp);
      loadUserBookings();
      Get.back();
      CustomSnackBar.showCustomSnackBar(
          title: "Successful", message: "${response.data["message"]}");
    } else {
      CustomSnackBar.showCustomErrorToast(
          message: 'Failed to Delete Service: ${response.statusMessage}',
          duration: const Duration(seconds: 1));
    }

  }

  // /// Give user review
  // Future<void> giveUserReview(serviceId, String? bookingId) async {
  //   Map<String, dynamic> requestData = {
  //     "comment": "${reviewController.text.trim()}",
  //     "rating": "${userRating}",
  //     "serviceId": ["$serviceId"],
  //     "workerId": ["${workersData.value!.user!.id}"],
  //   };
  //   var url = ApiList.userReviewUrl(bookingId!);
  //   var response = await apiService.putData(requestData, url);
  //   if (response.statusCode == 200) {
  //     var flag = response.data["flag"];
  //     if (flag) {
  //       CustomSnackBar.showCustomSnackBar(
  //           title: "Successful", message: "${response.data["message"]}");
  //     }
  //   } else {
  //     CustomSnackBar.showCustomErrorToast(
  //         message: 'Failed to give review: ${response.statusMessage}',
  //         duration: const Duration(seconds: 1));
  //   }
  // }

  /// pay due  amount
  Future<void> payDueAmount({required BookingsModel booking}
      ) async {
    Map<String, dynamic> requestData = {
      'amount': "${booking.totalAmount!.round() - booking.advanceAmount!.round()}",
      'bookingId': booking.id!,
      'addressInfo': {
        'name': booking.username!,
        'phone': booking.phone!,
        'area': booking.area!,
        'state': booking.state!,
        'city': booking.city!,
        'address': booking.address!,
      },
      'app': 'ammerpay-app'
    };
    print(requestData);
    var response= await apiService.postData(requestData, ApiList.userOrderCreateUrl);
    if (response.statusCode == 200) {
      var tranId=response.data['formData']["tran_id"];
      if(tranId !=null){
        _transactionId.value=tranId;

        Get.toNamed(AppPages.PaymentDue,arguments: booking);
      }
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Failed to payment Order',
          message: '${response.statusMessage}');
    }
  }

  /// Booking payment success
  Future<void> setPaymentSuccess()async{
    const appStatus= 'ammerpay-app';
    var response = await apiService.postWithOutData(ApiList.getPaymentSuccessUrl(_transactionId.value, appStatus));

    if(response.statusCode==200){

    }else{

    }

  }
  /// Booking payment cancel/fail
  Future<void> setPaymentCancel()async{
    const appStatus= 'ammerpay-app';
    var response = await apiService.postWithOutData(ApiList.getPaymentFailsUrl(_transactionId.value, appStatus));
    print("Fail response:${response.statusCode}");
    // CustomSnackBar.showCustomErrorToast(message: response.data["message"]);

  }



  /// Change order status
  Future<void> changeOrderStatus(String? bookingId, String status) async {
    Map<String, dynamic> statusData = {
      "paymentStatus": status,
    };
    await apiService.changeBookingStatus(bookingId!, statusData);
    await getAllBookingsByUid();
    loadUserBookings();
  }

  // void changeTabIndex(int index) {
  //   tabIndex.value = index;
  // }


  Future<bool> loadUserBookings() async {
    List<BookingsModel>? bookings = await MySharedPref.getUserBookings();
    if (bookings.isNotEmpty) {
      _bookingsList.assignAll(bookings);
    }
    return true;
  }

  @override
  void onInit() async {
    await getAllBookingsByUid();
    loadUserBookings();
    // tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // tabController.dispose();
    // reviewController.dispose();
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
          loadUserBookings();
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
