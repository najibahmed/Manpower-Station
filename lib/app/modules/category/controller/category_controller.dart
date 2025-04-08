import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import '../../../components/custom_snackbar.dart';
import '../../../network/api_list.dart';
import '../../home/service_repo/service_repository.dart';
import '../../service/model/service_list_model.dart';

class CategoryController extends BaseController {
  final ServiceRepository serviceRepository;
  CategoryController({required this.serviceRepository});

  final RxList _oneCategoryServicesData = <dynamic>[].obs;
  List get oneCategoryServicesData => _oneCategoryServicesData;
  final RxBool _isLoading=false.obs;
  bool get getLoading=>_isLoading.value;
  var categoryTitle = Get.arguments[0];
  final catId = Get.arguments[1];


  /// Get all Categories from server
  Future<void> fetchSingleCatServices()async{
    _isLoading.value=true;
    _oneCategoryServicesData.value=[];
    var response =  await serviceRepository.getData(ApiList.singleCategoryServiceUrl(catId));
    if (response.statusCode == 200) {
      var jsonData = response.data['servicesLists'];
      if(jsonData==null){
        _isLoading.value=false;
      }else{
      var serviceList = jsonData.map((item) => ServiceModel.fromJson(item)).toList();
      _oneCategoryServicesData.assignAll(serviceList);// Update the RxList with new data
      _isLoading.value=false;
      }
    } else {
      CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load services by one category:',message: ' ${response.statusMessage}');
    }
  }


  @override
  void onInit() async {
    fetchSingleCatServices();
    super.onInit();
  }

}
