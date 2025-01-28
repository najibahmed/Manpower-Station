
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:manpower_station/app/modules/home/service_repo/service_repository.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import '../../../components/custom_snackbar.dart';
import '../../../core/base/base_controller.dart';


class SearchViewController extends BaseController {
  final ServiceRepository repository;
  SearchViewController({required this.repository});
  Debouncer deBouncer = Debouncer(delay: const Duration(milliseconds: 500));
  var findByService = <dynamic>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;




  /// find service
  Future<void> findServices()async{
    late String url;
    if (searchController.text.isNotEmpty) {
      url = "/api/services/get/all?keyword=${searchController.text}";
    } else {
      url = "/api/services/get/all";
    }
    var response =  await repository.getData(url);
    if (response.statusCode == 200) {
      var jsonData = response.data['services'];
      var serviceList =
      jsonData.map((e) => ServiceModel.fromJson(e)).toList();
      findByService
          .assignAll(serviceList); // Update the RxList with new data
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Failed to load search service',
          message: '${response.statusMessage}');
    }
  }

  @override
  void onInit() {
    findServices();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
