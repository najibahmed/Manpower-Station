import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/utils/helper_function.dart';

import '../../service/view/service_list_grid.dart';

class SingleCategoryServices extends BaseView<CategoryController>{
  const SingleCategoryServices({super.key});

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
          floating: true,
            centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back,)
            ),
            title: const Text('')
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
                    return buildServiceCardShimmer();
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

