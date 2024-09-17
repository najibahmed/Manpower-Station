
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/modules/service_list/model/service_list_model.dart';

import '../../../services/api_client.dart';

class ServiceController extends BaseController  {
  var serviceData = <dynamic>[].obs;
  RxInt selectedTime=3.obs;
  RxString selectedTimeKey='Hours'.obs;
  RxList time = [3, 4, 5, 6, 7, 8].obs;

  TextEditingController nameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController houseNoController=TextEditingController();
  TextEditingController areaController=TextEditingController();
  TextEditingController thanaController=TextEditingController();
  TextEditingController postCodeController=TextEditingController();

  @override
  void onInit() {
    // getServiceData();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneNumberController.dispose();
    houseNoController.dispose();
    areaController.dispose();
    thanaController.dispose();
    postCodeController.dispose();
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