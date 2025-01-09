import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';


enum ServiceType{
  Hours,
  Days,
  Weeks,
  Months
}
class ServiceController extends BaseController with GetSingleTickerProviderStateMixin {


  late TabController tabController;
  TextEditingController reviewController = TextEditingController();
  RxInt timeLimit = 3.obs;       //dropdown time
  RxString selectedTimeKey = 'Hours'.obs;     //dropdown selected timekey
  var tabIndex = 0.obs;          //service details tab index
  RxDouble userRating = 0.0.obs;
  RxInt cartSubtotal = 0.obs;       //cartSubtotal service booking page
  // RxList time = [3, 4, 5, 6, 7, 8].obs;
  late ServiceModel selectedService;
  late ServiceModel serviceModel;
  Rx<DateTime?> selectedDateTime = DateTime.now().obs;    //service selected date time
  RxList<CartModel> cartItems = <CartModel>[].obs;
  var selectedValue = "Monthly".obs;


  // Get price
  getServicePrice(time, timeKey, price) {
    dynamic servicePrice;
    if (timeKey == ServiceType.Hours.name) {
      servicePrice = (price ~/ 3) * time;
    } else if (timeKey == 'Days') {
      servicePrice = price * time;
    } else if (timeKey == 'Weeks') {
      servicePrice = price * (time * 7);
    } else if (timeKey == 'Months') {
      servicePrice = price * (time * 30);
    }
    cartSubtotal.value = servicePrice;
    return servicePrice;
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



  /// on tap to select worker service is added to cart
  void addToCartList() {
    final cartModel = CartModel(
        serviceId: selectedService.id!,
        serviceName: selectedService.name!,
        serviceImageUrl: selectedService.image!,
        discountModel: selectedService.serviceDiscount!,
        startingDate: selectedDateTime.value.toString(),
        servicePrice: cartSubtotal.value,
        serviceTimeSchedule: "${timeLimit.value}${selectedTimeKey.value}");
    cartItems.add(cartModel);
  }


  @override
  void onInit() {
    serviceModel = Get.arguments;
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
