import 'package:get/get.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import 'package:manpower_station/app/network/api_service.dart';

class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(
          () => HelpController(apiService:Get.find<ApiServices>()),
    );
  }
}