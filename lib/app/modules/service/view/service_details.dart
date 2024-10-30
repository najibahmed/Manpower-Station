// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/modules/service/view/service_reviews.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';

class ServiceDetailsScreen extends GetView<ServiceController> {
  const ServiceDetailsScreen({
    super.key,
  });

  // @override
  // PreferredSizeWidget? appBar(BuildContext context) {
  //   return AppBar(
  //     leading: IconButton(
  //         onPressed: () {
  //           Get.offNamed(AppPages.DashboardView);
  //         },
  //         icon: Icon(Icons.arrow_back)),
  //     title: const Text(
  //       "Service Details",
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    ServiceModel service = Get.arguments;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //       // // leading: IconButton(
      //       // //     onPressed: () {
      //       // //       Get.offNamed(AppPages.DashboardView);
      //       // //     },
      //       // //     icon: Icon(Icons.arrow_back)),
      //       // title: const Text(
      //       //   "Service Details",
      //       // ),
      //     ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              // fit: StackFit.expand,
              children: [
                Hero(
                  tag: "imgHero",
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                    imageUrl: '${Constants.serviceImgUrl}${service.image}',
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.3,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: screenWidth * 1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          service.name!,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text("${service.ratings!} ${Constants.starSymbol} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                            // SizedBox(
                            //   child:RatingBar.builder(
                            //     initialRating: service.ratings!.toDouble(),
                            //     direction: Axis.horizontal,
                            //     ignoreGestures: true,
                            //     itemCount: 5,
                            //     itemSize: 22,
                            //     itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                            //     itemBuilder: (context, _) => const Icon(
                            //       Icons.star,
                            //       color: Colors.amber,
                            //     ), onRatingUpdate: (double value) {  },
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.06,
                  left: screenWidth * 0.03,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Get.offNamed(AppPages.DashboardView);
                          },
                          icon: const Icon(Icons.arrow_back,color: Colors.white,size: 26,)),
                    ),
                  ),
                ),
              ],
            ),
            _buildHeader(service, context),
            TabBar(
              labelPadding: const EdgeInsets.all(4),
              dividerColor: Colors.black12,
              indicatorColor: LightThemeColors.primaryColor,
              labelColor: LightThemeColors.primaryColor,
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              controller: controller.tabController,
              tabs: const [
                Tab(text: "Service Overview"),
                Tab(text: "Reviews"),
                Tab(text: "FAQ"),
              ],
            ),
            Obx(()=> _getTabAtIndex(controller.tabIndex.value, service)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ServiceModel service, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "${service.servicePrice} ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.lineThrough, fontSize: 20),
                  ),
                  Text(
                    "${Constants.banglaCurrency}${getDiscountAmount(service.serviceDiscount, service.servicePrice!)}",
                    style: const TextStyle(
                        fontSize: 26,
                        color: LightThemeColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " (starting with)",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.04,
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed(AppPages.ServiceBooking, arguments: service);
                },
                child: Text(
                  'Reserve Service',
                  style: TextStyle(
                      color: Colors.white, fontSize: MyFonts.buttonTextSize),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getTabAtIndex(int index, ServiceModel service) {
    var list = [
      ServiceDescription(
        service: service,
      ),
      ReviewsScreen(
        reviews: service.reviews!,
      ),
      _buildFAQTab(),
    ];
    return list[index];
  }

  Widget _buildFAQTab() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("FAQs will be displayed here"),
      ),
    );
  }
}

class ServiceDescription extends StatelessWidget {
  ServiceModel service;
  ServiceDescription({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Service Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              textAlign: TextAlign.justify,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              service.description!,
            ),
            const SizedBox(height: 16),
            // const Text(
            //   "Include Service",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 8),
            // const Text(
            //   "Elevate your casual style with our premium men's t-shirt. Crafted for comfort and designed with a modern fit, this versatile shirt is an essential addition to your wardrobe.",
            // ),
            // const SizedBox(height: 16),
            // const Text(
            //   "Exclude Service",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 8),
            // const Text(
            //   textAlign: TextAlign.justify,
            //   "This service does not include any repair or maintenance work."
            //   "Elevate your casual style with our premium men's t-shirt.Elevate your casual style with our premium men's t-shirt. Crafted for comfort and designed with a modern fit, this versatile shirt is an essential addition to your wardrobe."
            //   "Crafted for comfort and designed with a modern fit, this versatile shirt is an essential addition to "
            //   "your wardrobe.",
            // ),
          ],
        ),
      ),
    );
  }
}
