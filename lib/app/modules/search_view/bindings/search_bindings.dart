import 'package:get/get.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';

import '../../home/service_repo/service_repository.dart';

class SearchBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchViewController>(
          () => SearchViewController(repository:Get.find<ServiceRepository>()),
    );
  }

}