import 'package:get/get.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}