// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:manpower_station/app/models/active_banner.dart';
import 'package:manpower_station/app/models/category_model.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/network/api_list.dart';
import '../../../components/custom_snackbar.dart';
import '../../../core/base/base_controller.dart';
import '../../../network/api_client.dart';
import '../service_repo/service_repository.dart';

class HomeController extends BaseController {
  final ServiceRepository repository;
  HomeController({required this.repository});
 RxBool refreshLoading=false.obs;
  RxList _allServiceData = <dynamic>[].obs;
  List get allServiceData => _allServiceData;
  final _allCategoryData = <dynamic>[].obs;
  List get allCatData => _allCategoryData;




  /// Get all service from server
  Future<void> fetchAllService()async{
    var response =  await repository.getData(ApiList.getAllServiceUrl);
    if (response.statusCode == 200) {
      var jsonData = response.data['services'];
      var serviceList = jsonData.map((e) => ServiceModel.fromJson(e))
          .toList();
      _allServiceData.assignAll(serviceList);// Update the RxList with new data
    } else {
      CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load services:',message: '${response.statusMessage}');
    }
  }

// /// Get all service
//   Future<List> getAllServiceData() async {
//     try {
//       // Map<String, dynamic> requestData = {
//       //   'phone_or_email': phoneNumberEmailController.text.trim(),
//       // };
//       var url= ApiList.getAllServiceUrl;
//       await BaseClient.safeApiCall(
//           url,
//           RequestType.get,
//           onSuccess: (response) {
//             // if (kDebugMode) {
//             //   print(response.data);
//             // }
//             if (response.statusCode == 200) {
//               var jsonData = response.data['services'];
//               var serviceList = jsonData.map((e) => ServiceModel.fromJson(e))
//                   .toList();
//               allServiceData.assignAll(serviceList);// Update the RxList with new data
//               return allServiceData;
//             } else {
//               CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load services:',message: '${response.statusMessage}');
//             }
//           }
//       );
//     } catch (e) {
//       CustomSnackBar.showCustomErrorSnackBar(title:'Error try get service:',message: '$e');
//     }
//     return allServiceData;
//   }

  /// Get all Categories from server
  Future<void> fetchAllCategories()async{
    var response =  await repository.getData(ApiList.getAllServicesCategoriesUrl);
    if (response.statusCode == 200) {
      var jsonData = response.data['categories'];
      var categoryList = jsonData.map((e) => CategoryModel.fromJson(e))
          .toList();
      _allCategoryData.assignAll(categoryList);// Update the RxList with new data
    } else {
      CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load Categories:',message: '${response.statusMessage}');
    }
  }


  /// Get active banners for dashboard
  late Rx<ActiveBanner> activeBanners=ActiveBanner().obs;
  Future<void> getBanners()async {
    var response =  await repository.getData(ApiList.activeAppBannersUrl);
    if (response.statusCode == 200) {
      var jsonData = response.data['banner'];
      activeBanners.value = ActiveBanner.fromJson(jsonData);
    } else {
      CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load banners:',message:  '${response.statusMessage}');
    }
  }


  @override
  void onInit() {
    getBanners();
    fetchAllService();
    fetchAllCategories();
    // getAllServiceData();
    // getAllServiceCategories();
    super.onInit();
  }

}
