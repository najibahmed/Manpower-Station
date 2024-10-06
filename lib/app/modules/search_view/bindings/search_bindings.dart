import 'package:get/get.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';

class SearchBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchViewController>(
          () => SearchViewController(),
    );
  }

}