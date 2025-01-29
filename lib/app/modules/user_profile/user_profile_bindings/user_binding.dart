import 'package:get/get.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/update_profile_controller.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';

import '../user_repo/user_repository.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(userRepository:Get.find<UserRepository>()));
    // Get.lazyPut<UpdateProfileController>(() => UpdateProfileController(userRepository:Get.find<UserRepository>()));
  }
}