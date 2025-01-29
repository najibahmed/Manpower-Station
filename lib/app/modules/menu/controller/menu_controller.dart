// ignore_for_file: unnecessary_import

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';

import '../../../data/local/my_shared_pref.dart';

class MenusController extends BaseController{

  bool clearSharedPrefData(){
    MySharedPref.clearUserId();
    MySharedPref.setLoginStatus(false);
    MySharedPref.clearAccessToken();
    MySharedPref.clearRefreshToken();
    MySharedPref.clearUser();
    MySharedPref.clearBookingList();
    return true;
  }


  @override
  void onInit() {
    Get.find<UserController>().loadUserData;
    super.onInit();
  }



}