import 'package:get/get.dart';
import 'package:manpower_station/app/models/active_banner.dart';
import 'package:manpower_station/app/models/category_model.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/services/api_client.dart';

import '../../../components/custom_snackbar.dart';
import '../../../core/base/base_controller.dart';

class HomeController extends BaseController {
  var allServiceData = <dynamic>[].obs;
  var allCategoryData = <dynamic>[].obs;

/// Get all service
  Future<void> getAllServiceData() async {
    try {
      // Map<String, dynamic> requestData = {
      //   'phone_or_email': phoneNumberEmailController.text.trim(),
      // };
      var url="/api/services/get/all";
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
              CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load services:',message: '${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title:'Error try get service:',message: '$e');
    }
  }

  /// Get all service categories
  Future<void> getAllServiceCategories() async {
    try {
      var url="/api/services/categories/get/all";
      await BaseClient.safeApiCall(
          url,
          RequestType.get,
          onSuccess: (response) {
            // if (kDebugMode) {
            //   print(response.data);
            // }
            if (response.statusCode == 200) {
              var jsonData = response.data['categories'];
              var categoryList = jsonData.map((e) => CategoryModel.fromJson(e))
                  .toList();
              allCategoryData.assignAll(categoryList);// Update the RxList with new data
            } else {
              CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load Categories:',message: '${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title:'Error try get category:',message: '$e');
    }
  }

  /// Get one category service
  RxList oneCategoryServicesData = <dynamic>[].obs;
  Future<void> getOneCategoryServices(String id) async {
    try {
      var url="/api/services/categories/services/$id";
      await BaseClient.safeApiCall(
          url,
          RequestType.get,
          onSuccess: (response) {
            // if (kDebugMode) {
            //   print(response.data);
            // }
            if (response.statusCode == 200) {
              var jsonData = response.data['servicesLists'];
              var serviceList = jsonData.map((item) => ServiceModel.fromJson(item))
                  .toList();
              oneCategoryServicesData.assignAll(serviceList);// Update the RxList with new data
            } else {
              CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load services by one category:',message: ' ${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title:'Error try get all service cat:',message: '$e');
    }
  }

  /// Get active banners for dashboard
  late Rx<ActiveBanner> activeBanners=ActiveBanner().obs;
  Future<void> getActiveBanners() async {
    try {
      var url="/api/banners/get/active";
      await BaseClient.safeApiCall(
          url,
          RequestType.get,
          onSuccess: (response) {
            // if (kDebugMode) {
            //   print(response.data);
            // }
            if (response.statusCode == 200) {
              var jsonData = response.data['banner'];
              activeBanners.value = ActiveBanner.fromJson(jsonData);
            } else {
              CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load banners:',message:  '${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title:'Error try get banner:',message: '$e');

    }
  }

  @override
  void onInit() {
    getActiveBanners();
    getAllServiceData();
    getAllServiceCategories();
    super.onInit();
  }



}
