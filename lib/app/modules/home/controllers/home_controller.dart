import 'package:get/get.dart';
import 'package:manpower_station/app/models/category_model.dart';
import 'package:manpower_station/app/models/category_services.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/services/api_client.dart';

import '../../../core/base/base_controller.dart';

class HomeController extends BaseController {
  var allServiceData = <dynamic>[].obs;
  var allCategoryData = <dynamic>[].obs;

  Future<void> getAllServiceData() async {
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
              allServiceData.assignAll(serviceList);// Update the RxList with new data
            } else {
              print('Failed to load services: ${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      print(e);
    }
  }
  Future<void> getAllServiceCategories() async {
    try {
      var url="http://172.16.154.43/api/services/categories/get/all";
      await BaseClient.safeApiCall(
          url,
          RequestType.get,
          onSuccess: (response) {
            // if (kDebugMode) {
            //   print(response.data);
            // }
            if (response.statusCode == 200) {
              var jsonData = response.data['categories'];
              print('Category Data--------->$jsonData');
              var categoryList = jsonData.map((e) => CategoryModel.fromJson(e))
                  .toList();
              allCategoryData.assignAll(categoryList);// Update the RxList with new data
            } else {
              print('Failed to load Categories: ${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      print(e);
    }
  }


  RxList oneCategoryServicesData = <dynamic>[].obs;
  Future<void> getOneCategoryServices(String id) async {
    try {
      var url="http://172.16.154.43/api/services/categories/services/$id";
      await BaseClient.safeApiCall(
          url,
          RequestType.get,
          onSuccess: (response) {
            // if (kDebugMode) {
            //   print(response.data);
            // }
            if (response.statusCode == 200) {
              var jsonData = response.data['servicesLists'];
              print('-----JsonData:$jsonData');
              var serviceList = jsonData.map((item) => CategoryServicesModel.fromJson(item))
                  .toList();
              print('here service List--------------->$serviceList');
              oneCategoryServicesData.assignAll(serviceList);// Update the RxList with new data
            print('here category data Services--------------->$oneCategoryServicesData');
            } else {
              print('Failed to load services by one category: ${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getAllServiceData();
    getAllServiceCategories();
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
