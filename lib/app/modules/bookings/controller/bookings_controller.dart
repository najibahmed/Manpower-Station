import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/network/api_list.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../network/api_client.dart';
import '../../../network/api_service.dart';

class BookingsController extends BaseController with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt tabIndex = 0.obs;
  RxList bookingsList = <dynamic>[].obs;
  RxDouble userRating = 1.0.obs;
  TextEditingController reviewController = TextEditingController();
  Rx<WorkerModel?> workersData = WorkerModel().obs;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();

  void getWorkerInformation(String id) async {
    var worker = await ApiServices.getSingleWorker(id);
    workersData.value = worker;
  }

  Future<void> giveUserReview(serviceId, String? bookingId) async {
    Map<String, dynamic> requestData = {
      "comment": "${reviewController.text.trim()}",
      "rating": "${userRating}",
      "serviceId": ["$serviceId"],
      "workerId": ["${workersData.value!.user!.id}"],
    };
    await ApiServices.userReview(bookingId, requestData);
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    // getAllBookingsByUid();
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
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
        'Authorization': MySharedPref.getAccessToken()
        //Constants.accessToken         //MySharedPref.getAccessToken()
      }, onSuccess: (response) {
        if (response.statusCode == 201) {
          var jsonData = response.data['bookings'];
          var bookings =
              jsonData.map((e) => BookingsModel.fromJson(e)).toList();
          bookingsList.assignAll(bookings); // Update the RxList with new data
        } else {
          CustomSnackBar.showCustomErrorSnackBar(
              title: 'Failed to load Workers:',
              message: '${response.statusMessage}');
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Error bookings :', message: e.toString());
    }
  }
}
