
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/services/api_client.dart';


class CategoryController extends BaseController {
  RxBool isLoading=true.obs;
  @override
  void onInit() async{
    Future.delayed(const Duration(seconds:2),(){
      isLoading.value=false;
    });
    super.onInit();
  }
}
