import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

class DashBoardController extends BaseController{
  final selectedIndex=0.obs;
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}