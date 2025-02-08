import 'package:get/get.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/network/api_service.dart';

import '../controller/booking_details_controller.dart';

class BookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsController>(
          () => BookingsController(apiService: Get.find<ApiServices>()),
    );
    Get.lazyPut<BookingDetailsController>(
          () => BookingDetailsController(apiService: Get.find<ApiServices>()),
    );
  }
}