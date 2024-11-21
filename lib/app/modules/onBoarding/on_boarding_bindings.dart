
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/onBoarding/on_boarding_controller.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    // Get.lazyPut<UserController>(() => UserController(),fenix: true);
  }
}