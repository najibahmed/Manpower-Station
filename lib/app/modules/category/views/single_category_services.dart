import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/lottie_loading.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/category/controller/category_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';

import '../../service/view/service_card.dart';

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
        // '${controller.serviceList.first.serviceCategoryId.categoryName}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    /// future builder function for get services for a particular category
    return FutureBuilder<List<dynamic>>(
      future: controller.getSingleCatServices(
          controller.catId), // Call the async function here
      builder: (context, snapshot) {
        // Check the state of the Future
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the data is being fetched, show a loading spinner
          return const LottieLoading();
          //   Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 12),
          //   child: GridView.builder(
          //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             crossAxisSpacing: 10,
          //             mainAxisSpacing: 10,
          //             childAspectRatio: 0.75,
          //           ),
          //           itemCount: 4,
          //           itemBuilder: (context, index) {
          //             return buildServiceCardShimmer();
          //           },),
          // );
        } else if (snapshot.hasError) {
          // If there's an error, display it
          return Center(child: Text('Error: ${snapshot.error}',style: const TextStyle(color: Colors.black54)));
        } else if (snapshot.hasData) {
          // If data is available, build the list view
          List<dynamic>? data = snapshot.data;
          if(data==null){
            return  Center(child: Text('Error: ${snapshot.error}',style: const TextStyle(color: Colors.black54)));
          }else{
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: data.length,
                    (context, index) {
                      ServiceModel service = data[index];
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
                    },
                  ),
                ),
              ),
            ],
          );}
        } else {
          // If there's no data, display a message
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
