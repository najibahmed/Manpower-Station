import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:manpower_station/app/services/api_service.dart';
import 'package:manpower_station/utils/constants.dart';

class BookingsController extends BaseController with GetSingleTickerProviderStateMixin{
   late TabController tabController;
   RxInt tabIndex=0.obs;
   RxList bookingsList= <dynamic>[].obs;
   RxDouble userRating=0.0.obs;
   // late RxList workersData=<WorkerModel>[].obs;
   // void getWorkerInformation(String id)async{
   //   var worker= await ApiServices.getSingleWorker(id);
   //   workersData.assign(worker);
   //    }


   void changeTabIndex(int index) {
     tabIndex.value = index;
   }
   Future<void> getAllBookingsByUid() async {
     var userID=Constants.userId;
     try {
       var url="/api/bookings/get/unique/user/booking/$userID";
       await BaseClient.safeApiCall(
           url,
           RequestType.get,
           headers: {
             'Authorization': Constants.accessToken
           },
           onSuccess: (response) {
             if (response.statusCode == 201) {
               var jsonData = response.data['bookings'];
               var bookings = jsonData.map((e) => BookingsModel.fromJson(e))
                   .toList();
               bookingsList.assignAll(bookings);// Update the RxList with new data
             } else {
               print('Failed to load Workers: ${response.statusMessage}');
             }
           }
       );
     } catch (e) {
       print(e);
     }
   }

  @override
  void onInit() {
     getAllBookingsByUid();
    tabController = TabController(length: 2,initialIndex: 0,vsync: this);
    super.onInit();
  }



  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}