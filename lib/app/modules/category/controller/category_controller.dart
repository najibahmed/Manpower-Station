
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/services/api_client.dart';

import '../../../components/custom_snackbar.dart';
import '../../service/model/service_list_model.dart';


class CategoryController extends BaseController {
  RxBool isLoading=true.obs;
  // RxList oneCategoryServicesData = <dynamic>[].obs;
List serviceList=<dynamic>[].obs;
   var categoryTitle=Get.arguments[0];
  final catId=Get.arguments[1];

  /// Get one category service

  Future<List<dynamic>> getOneCategoryServices(String id) async {
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
               serviceList = jsonData.map((item) => ServiceModel.fromJson(item))
                  .toList();
            } else {
              CustomSnackBar.showCustomErrorSnackBar(title:'Failed to load services by one category:',message: ' ${response.statusMessage}');
            }
          }
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title:'Error try get all service cat:',message: '$e');
    }
    return serviceList;
  }
  // Future<void> getAllServiceCategories() async {
  //   try {
  //     var url="/api/services/categories/get/all";
  //     await BaseClient.safeApiCall(
  //         url,
  //         RequestType.get,
  //         onSuccess: (response) {
  //           // if (kDebugMode) {
  //           //   print(response.data);
  //           // }
  //           if (response.statusCode == 200) {
  //             var jsonData = response.data['categories'];
  //             var categoryList = jsonData.map((e) => CategoryModel.fromJson(e))
  //                 .toList();
  //             allCategoryData.assignAll(categoryList);// Update the RxList with new data
  //           } else {
  //             print('Failed to load Categories: ${response.statusMessage}');
  //           }
  //         }
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
/// Get one category service list
//   Future<void> getOneCategoryServices(String id) async {
//     try {
//       var url="/api/services/categories/services/$id";
//       await BaseClient.safeApiCall(
//           url,
//           RequestType.get,
//           onSuccess: (response) {
//             // if (kDebugMode) {
//             //   print(response.data);
//             // }
//             if (response.statusCode == 200) {
//               var jsonData = response.data['servicesLists'];
//               var serviceList = jsonData.map((item) => ServiceModel.fromJson(item))
//                   .toList();
//               oneCategoryServicesData.assignAll(serviceList);// Update the RxList with new data
//             } else {
//               print('Failed to load services by one category: ${response.statusMessage}');
//             }
//           }
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

  @override
  void onInit() async{
    Future.delayed(const Duration(seconds:2),(){
      isLoading.value=false;
    });

    super.onInit();
  }
}
