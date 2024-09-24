import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

class OrderController extends BaseController with GetSingleTickerProviderStateMixin{
   late TabController tabController;
  //TODO: Implement HomeController

  @override
  void onInit() {
    tabController = TabController(length: 2,initialIndex: 0,vsync: this);
    super.onInit();
  }



  @override
  void onClose() {
    // tabController.dispose();
    super.onClose();
  }

}