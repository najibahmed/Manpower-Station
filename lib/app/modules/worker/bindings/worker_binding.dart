import 'package:get/get.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';

class WorkerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WorkerController>(() => WorkerController());
  }
}