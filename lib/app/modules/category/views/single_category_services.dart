import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import '../../../../utils/helper_function.dart';
import 'service_card.dart';

class SingleCategoryServices extends BaseView<CategoryController> {
  const SingleCategoryServices({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          )),
      title: Text(
        controller.categoryTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
        slivers: [
          controller.getLoading? SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount:4,
                    (context, index) {
                    return HelperFunction.instance.buildServiceCardShimmer();

                },
              ),
            ),
          ): controller.oneCategoryServicesData.isEmpty? SliverToBoxAdapter(
            child: Center(
              child:  Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.4),
                  const Text("No Service Avaiable!!"),
                ],
              ),
            ),
          ):SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: controller.oneCategoryServicesData.length,
                    (context, index) {
                  ServiceModel service = controller.oneCategoryServicesData[index];
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
                  );}
              ),
            ),
          ),
        ],
      );
  }}