import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';

import '../../../services/api_client.dart';

class ServiceController extends BaseController
    with GetSingleTickerProviderStateMixin {

  TextEditingController reviewController=TextEditingController();
  var serviceData = <dynamic>[].obs;
  RxInt timeLimit = 3.obs;
  RxString selectedTimeKey = 'Hours'.obs;
  RxList time = [3, 4, 5, 6, 7, 8].obs;
  late TabController tabController;
  var tabIndex = 0.obs;
  RxList<DateTime> highlightedDates = <DateTime>[].obs;
  Rx<DateTime>? selectedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDateTime = DateTime.now().obs;
  late ServiceModel selectedService;
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxDouble userRating=0.0.obs;

  // Get price
  getServicePrice(time, timeKey, price) {
    if (timeKey == 'Hours') {
      var servicePrice = (price ~/ 3) * time;
      return servicePrice;
    } else if (timeKey == 'Days') {
      var servicePrice = price * time;
      return servicePrice;
    } else if (timeKey == 'Weeks') {
      var servicePrice = price * (time * 7);
      return servicePrice;
    } else if (timeKey == 'Months') {
      var servicePrice = price * (time * 30);
      return servicePrice;
    }
  }

  // Function to update tab index
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
/// Calculate cart subtotal
//   num getCartSubTotal() {
//     num total = 0;
//     for (final cartModel in cartItems) {
//       total += cartModel.servicePrice;
//     }
//     return total;
//   }

  /// Get Service Data
  Future<void> getServiceData() async {
    try {
      // Map<String, dynamic> requestData = {
      //   'phone_or_email': phoneNumberEmailController.text.trim(),
      // };
      var url = "/api/services/get/all";
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        // if (kDebugMode) {
        //   print(response.data);
        // }
        if (response.statusCode == 200) {
          var jsonData =
              response.data['services']; // Assuming the response is a list
          var serviceList =
              jsonData.map((e) => ServiceModel.fromJson(e)).toList();
          serviceData.assignAll(serviceList); // Update the RxList with new data
        } else {
          print('Failed to load services: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  /// Create Review
  Future<void> createReview() async {
    try {
      Map<String, dynamic> requestData = {
        'comment': reviewController.text.trim(),
        'serviceId': reviewController.text.trim(),
      };
      var url = "/api/reviews/create/review/:bookingId";
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        // if (kDebugMode) {
        //   print(response.data);
        // }
        if (response.statusCode == 200) {
          // var jsonData =
          //     response.data['services']; // Assuming the response is a list
          // var serviceList =
          //     jsonData.map((e) => ServiceModel.fromJson(e)).toList();
          // serviceData.assignAll(serviceList); // Update the RxList with new data
        } else {
          print('Failed to load services: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print(e);
    }
  }

/// on tap to select worker service is added to cart
  void addToCartList() {
    final cartModel = CartModel(
        serviceId: selectedService.id!,
        serviceName: selectedService.name!,
        serviceImageUrl: selectedService.image!,
        discountModel: selectedService.serviceDiscount!,
        startingDate: selectedDateTime.value.toString(),
        servicePrice: selectedService.servicePrice!,
        serviceTimeSchedule: "${timeLimit.value}${selectedTimeKey.value}");
    cartItems.add(cartModel);
    print("----cart first item---->${cartItems.first.toMap()}");
  }

  @override
  void onInit() {
    // getServiceData();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
