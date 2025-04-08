
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

class OnBoardingController extends BaseController{
  late PageController pageController;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }


  void updatePage(int index) {
    currentPage.value = index;
  }
}