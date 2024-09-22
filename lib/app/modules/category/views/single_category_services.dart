import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/category_services.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';

import '../../service/view/service_list_grid.dart';

class SingelCategoryServices extends BaseView<CategoryController>{
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    List<dynamic> services= Get.arguments;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)
            ),
            title: Text('')
            ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: controller.isLoading.value
                    ? 6
                    : services.length,
                    (context, index) {
                  if (controller.isLoading.value) {
                    return _buildServiceCardShimmer();
                  } else {
                    ServiceModel service = services[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppPages.ServiceDetails,
                            arguments: service);
                      },
                      child: ServiceCard(
                        title: service.name!,
                        image: service.image!,
                        service: service,
                      ),
                    );
                  }
                },
              )),
        ),
      ],
    );
  }

}
Widget _buildServiceCardShimmer() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 4,
    child: const Column(
      children: [
        ShimmerWidget.rectangular(height: 120),
        SizedBox(
          height: 10,
        ),
        ShimmerWidget.rectangular(
          height: 20,
          width: 110,
        ),
        Spacer(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
                alignment: Alignment.center,
                child: ShimmerWidget.rectangular(
                  height: 20,
                  width: 150,
                ))),
        SizedBox(height: 10),
      ],
    ),
  );
}
