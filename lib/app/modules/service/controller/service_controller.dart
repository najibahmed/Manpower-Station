
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';


import '../../../services/api_client.dart';

class ServiceController extends BaseController with GetSingleTickerProviderStateMixin  {
  var serviceData = <dynamic>[].obs;
  RxInt timeLimit=3.obs;
  RxString selectedTimeKey='Hours'.obs;
  RxList time = [3, 4, 5, 6, 7, 8].obs;
  late TabController tabController;
  var tabIndex = 0.obs;
  RxList<DateTime> highlightedDates = <DateTime>[].obs;
  Rx<DateTime>? selectedDay=DateTime.now().obs;
  Rx<DateTime?>selectedDateTime=DateTime.now().obs;




  // Get price
   getServicePrice(time,timeKey,price){
    if(timeKey=='Hours'){
      var servicePrice=(price/time)*time;
      return servicePrice;
    }else if(timeKey=='Days'){
      var servicePrice=price*time;
      return servicePrice;
    }else if(timeKey=='Weeks'){
      var servicePrice=price*(time*7);
      return servicePrice;
    }else if(timeKey=='Months'){
      var servicePrice=price*(time*30);
      return servicePrice;
    }
  }


  // Function to update tab index
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }


  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController addressLine1Controller=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController zipCodeController=TextEditingController();

  @override
  void onInit() {
    // getServiceData();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    addressLine1Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    super.onClose();
  }

  Future<void> getServiceData() async {
    try {
      // Map<String, dynamic> requestData = {
      //   'phone_or_email': phoneNumberEmailController.text.trim(),
      // };
      var url="http://172.16.154.43/api/services/get/all";
      await BaseClient.safeApiCall(
        url,
        RequestType.get,
        onSuccess: (response) {
          // if (kDebugMode) {
          //   print(response.data);
          // }
          if (response.statusCode == 200) {
            var jsonData = response.data['services']; // Assuming the response is a list
            var serviceList = jsonData.map((e) => ServiceModel.fromJson(e))
                .toList();
            serviceData.assignAll(serviceList);// Update the RxList with new data
          } else {
            print('Failed to load services: ${response.statusMessage}');
          }
        }
      );
    } catch (e) {
      print(e);
    }
    }
  }