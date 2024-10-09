import 'package:get/get.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';

class BookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsController>(
          () => BookingsController(),
    );
  }
}