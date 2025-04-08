import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/auth_repository/auth_repo.dart';

import '../Auth controller/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(authRepo: Get.find<AuthRepository>()),
    );
  }
}
