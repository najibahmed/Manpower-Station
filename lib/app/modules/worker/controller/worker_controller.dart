import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/services/api_client.dart';

class WorkerController extends BaseController{
  var allWorkerList= <dynamic>[].obs;
  RxBool isLoading=true.obs;
  RxList<WorkerModel>selectedWorkerList=<WorkerModel>[].obs;

 void addWorker(WorkerModel worker){
   return selectedWorkerList.add(worker);
 }

 void removeWorker( workerId){
    var temp=selectedWorkerList.where((worker)=>worker.id!=workerId).toList();
    selectedWorkerList.value=temp;
 }

  Future<void> getAllWorkerData() async {
    try {
      var url="http://172.16.154.43/api/workers/get/all";
      await BaseClient.safeApiCall(
          url,
          RequestType.get,
          onSuccess: (response) {
            if (response.statusCode == 201) {
              var jsonData = response.data['workers'];
              var workerList = jsonData.map((e) => WorkerModel.fromJson(e))
                  .toList();
              allWorkerList.assignAll(workerList);// Update the RxList with new data
            } else {
              print('Failed to load Workers: ${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      print(e);
    }
  }


  @override
  void onInit() {
    getAllWorkerData();
    Future.delayed(const Duration(seconds:1),(){
      isLoading.value=false;
    });
    // TODO: implement onInit
    super.onInit();
  }
}