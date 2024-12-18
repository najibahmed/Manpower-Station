import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20Bindings/authentication_binding.dart';
import 'package:manpower_station/app/modules/onBoarding/on_boarding_bindings.dart';

import '../connection_manager/connection_manager_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    ConnectionManagerBinding().dependencies();
    AuthenticationBinding().dependencies();
    OnBoardingBindings().dependencies();
  }
}
