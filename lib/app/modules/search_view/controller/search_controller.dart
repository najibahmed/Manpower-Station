import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_view.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/services/api_client.dart';

import '../../../core/base/base_controller.dart';

class SearchViewController extends BaseController {
  var findByService = <dynamic>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;

  /// find service with workerId
  Future<void> findServices() async {

    try {
      late String url;
      if(searchController.text.isNotEmpty){
         url = "/api/services/get/all?keyword=${searchController.text}}";
      }else{
        url="/api/services/get/all";
      }
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        if (response.statusCode == 200) {
          var jsonData = response.data['services'];
          var serviceList =
              jsonData.map((e) => ServiceModel.fromJson(e)).toList();
          findByService
              .assignAll(serviceList); // Update the RxList with new data
        } else {
          print('Failed to load service: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    searchController.addListener(_showLoading);
    super.onInit();
  }

  /// Control Loading
  void _showLoading() async{
    if (searchController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        late String url;
        if(searchController.text.trim().isNotEmpty){
          url = "/api/services/get/all?keyword=${searchController.text.trim()}";
          print("search key----->=${searchController.text.trim()}}");
        }else{
          url="/api/services/get/all";
        }
        await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
          if (response.statusCode == 200) {
            var jsonData = response.data['services'];
            var serviceList =
            jsonData.map((e) => ServiceModel.fromJson(e)).toList();
            findByService
                .assignAll(serviceList); // Update the RxList with new data
          } else {
            print('Failed to load service: ${response.statusMessage}');
          }
        });
      } catch (e) {
        print(e);
      }
      Future.delayed(
          const Duration(
            seconds: 2,
          ), () {
        isLoading.value = false;
      });
    }
  }


  @override
  void onClose() {
    // searchController.dispose();
    super.onClose();
  }
}
