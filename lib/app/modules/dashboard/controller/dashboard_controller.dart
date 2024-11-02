import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

class DashBoardController extends BaseController{
  final selectedIndex=0.obs;
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
  @override
  void onInit() {
    selectedIndex.value=0;
    super.onInit();
  }

}