import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/bookings_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:manpower_station/app/services/api_service.dart';
import 'package:manpower_station/utils/constants.dart';

class BookingsController extends BaseController with GetTickerProviderStateMixin{
   late TabController tabController;
   RxInt tabIndex=0.obs;
   RxList bookingsList= <dynamic>[].obs;
   RxDouble userRating=1.0.obs;
   TextEditingController reviewController=TextEditingController();
    Rx<WorkerModel?> workersData=WorkerModel().obs;
    RxBool isLoading=true.obs;
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   FocusNode focusNode=FocusNode();

   void getWorkerInformation(String id)async{
     var worker= await ApiServices.getSingleWorker(id);
     workersData.value=worker;
      }


  Future<void> giveUserReview(serviceId, String? bookingId)async{

  Map<String,dynamic> requestData = {
    "comment":"${reviewController.text.trim()}",
    "rating":"${userRating}",
    "serviceId":["$serviceId"],
    "workerId":["${workersData.value!.user!.id}"],
  };
    await ApiServices.userReview(bookingId, requestData);

  }

   void changeTabIndex(int index) {
     tabIndex.value = index;
   }
   /// get all bookings for particular userId
   Future<void> getAllBookingsByUid() async {
     var userID=Constants.userId;
     try {
       var url="/api/bookings/get/unique/user/booking/$userID";
       await BaseClient.safeApiCall(
           url,
           RequestType.get,
           // headers: {
           //   'Authorization': Constants.accessToken
           // },
           onSuccess: (response) {
             if (response.statusCode == 201) {
               var jsonData = response.data['bookings'];
               var bookings = jsonData.map((e) => BookingsModel.fromJson(e))
                   .toList();
               bookingsList.assignAll(bookings);// Update the RxList with new data
             } else {
               CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load Workers:',message:'${response.statusMessage}');
             }
           }
       );
     } catch (e) {
       CustomSnackBar.showCustomErrorSnackBar(title: 'Error bookings :',message: e.toString());
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
    reviewController.dispose();
    super.onClose();
  }

}