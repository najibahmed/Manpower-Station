import 'package:get/get.dart';
import 'package:manpower_station/app/modules/service_list/model/service_list_model.dart';
import 'package:manpower_station/app/services/api_client.dart';

import '../../../core/base/base_controller.dart';

class HomeController extends BaseController {
  var serviceData = <dynamic>[].obs;

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
              var jsonData = response.data['services'];
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

  @override
  void onInit() {
    getServiceData();
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
