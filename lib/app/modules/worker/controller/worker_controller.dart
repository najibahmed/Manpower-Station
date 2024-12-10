import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import '../../../components/custom_snackbar.dart';
import '../../../network/api_client.dart';

class WorkerController extends BaseController {
  // var allWorkerList = <dynamic>[].obs;
  RxDouble userRating = 0.0.obs;
  RxList<WorkerModel> selectedWorkerList = <WorkerModel>[].obs;
  Debouncer deBouncer = Debouncer(delay: const Duration(milliseconds: 500));
  TextEditingController workerSearchController = TextEditingController();
  RxBool isLoading = true.obs;
  final findByWorker = <dynamic>[].obs;


  @override
  void onInit() {
    findWorkers();
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
    // TODO: implement onInit
    super.onInit();
  }

  /// Add worker list
  void addWorker(WorkerModel worker) {
    return selectedWorkerList.add(worker);
  }
  /// Remove worker from workerList
  void removeWorker(workerId) {
    var temp = selectedWorkerList
        .where((worker) => worker.user!.id != workerId)
        .toList();
    selectedWorkerList.value = temp;
  }

  /// Check weather worker is selected or not
  bool isWorkerSelected(String uId) {
    bool tag = false;
    for (final worker in selectedWorkerList) {
      if (worker.user?.id == uId) {
        tag = true;
        break;
      }
    }
    return tag;
  }

  // Future<void> getAllWorkerData() async {
  //   try {
  //     var url= "/api/workers/get/all";
  //     await BaseClient.safeApiCall(
  //         url,
  //         RequestType.get,
  //         onSuccess: (response) {
  //           if (response.statusCode == 201) {
  //             var jsonData = response.data['workers'];
  //             var workerList = jsonData.map((e) => WorkerModel.fromJson(e))
  //                 .toList();
  //             allWorkerList.assignAll(workerList);// Update the RxList with new data
  //           } else {
  //             print('Failed to load Workers: ${response.statusMessage}');
  //           }
  //         }
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> findWorkers() async {
    try {
      late String url;
      if (findByWorker.isEmpty) {
        url = "/api/workers/get/all";
      } else if (workerSearchController.text.isNotEmpty) {
        url = "/api/workers/get/all?keyword=${workerSearchController.text}";
      } else {
        url = "/api/workers/get/all";
      }
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        if (response.statusCode == 201) {
          var jsonData = response.data['workers'];
          var workerList =
              jsonData.map((e) => WorkerModel.fromJson(e)).toList();
          findByWorker.assignAll(workerList); // Update the RxList with new data
        } else {
          CustomSnackBar.showCustomErrorToast(
              message: 'Failed to load Worker: ${response.statusMessage}',
              duration: const Duration(seconds: 1));
        }
      });
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Error try find worker:',
          message: '$e',
          duration: const Duration(seconds: 1));
    }
  }


  @override
  void onClose() {
    workerSearchController.dispose();
    super.onClose();
  }
}
