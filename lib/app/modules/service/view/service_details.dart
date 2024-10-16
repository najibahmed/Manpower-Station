// ignore_for_file: must_be_immutable

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

class ServiceDetailsScreen extends BaseView<ServiceController> {
  const ServiceDetailsScreen({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Service Details",
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    ServiceModel service = Get.arguments;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Adding header with image, title, rating, etc.
            _buildHeader(service, context),
            TabBar(
              labelPadding: const EdgeInsets.all(4),
              dividerColor: Colors.black12,
              indicatorColor: LightThemeColors.primaryColor,
              labelColor: LightThemeColors.primaryColor,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
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
            _getTabAtIndex(controller.tabIndex.value, service),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ServiceModel service, context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: "imgHero",
              child: Image.network(
                '${Constants.serviceImgUrl}${service.image}', // Replace with actual image URL or asset path
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name!,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                 SizedBox(
                  child:RatingBar.builder(
                    initialRating: service.ratings! .toDouble() ,
                    minRating: 0.0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 22,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ), onRatingUpdate: (double value) {  },
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${service.servicePrice} ",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 18,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${Constants.banglaCurrency}${getDiscountAmount(service.serviceDiscount,service.servicePrice!)}",
                      style: const TextStyle(
                          fontSize: 22,
                          color: LightThemeColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      " (starting with)",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
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
                    Get.toNamed(AppPages.ServiceBooking, arguments: service);
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
      ),
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
              style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
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
