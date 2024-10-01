// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/modules/service/view/service_reviews.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/helper_function.dart';

class ServiceDetailsScreen extends BaseView<ServiceController> {
  const ServiceDetailsScreen({
    super.key,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Service Details",),
    );
  }

  @override
  Widget body(BuildContext context) {
    final ServiceModel service = Get.arguments;
   return SingleChildScrollView(
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           _buildHeader(service,context),
           // Adding header with image, title, rating, etc.
           TabBar(
             onTap: (index){
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
  Widget _buildHeader(ServiceModel service,context) {
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
                'http://172.16.154.43/images/services/${service.image}', // Replace with actual image URL or asset path
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
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star_border, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text("4.65 (645 Reviews)"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text( "${calculatePriceAfterDiscount(service.servicePrice!, service.serviceDiscount!.discount!)}৳ ",
                      style: const TextStyle(
                          fontSize: 20, color: LightThemeColors.primaryColor, fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "${service.servicePrice}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),const Text(
                      " (starting with)",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Text(
                //   "Experienced cleaners for home and apartment services.",
                //   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                // ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.width*0.09,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPages.ServiceBooking,arguments: service);
                  },
                  child:  Text('Book now',style: TextStyle(color: Colors.white,fontSize: MyFonts.buttonTextSize),),
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
      ReviewsScreen(reviews: service.reviews!,),
      _buildFAQTab(),
    ];
    return list[index];
  }


  Widget _buildFAQTab() {
    return const Center(
      child: Text("FAQs will be displayed here"),
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
              service.description!,
            ),
            const SizedBox(height: 16),
            const Text(
              "Include Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Elevate your casual style with our premium men's t-shirt. Crafted for comfort and designed with a modern fit, this versatile shirt is an essential addition to your wardrobe.",
            ),
            const SizedBox(height: 16),
            const Text(
              "Exclude Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              textAlign: TextAlign.justify,
              "This service does not include any repair or maintenance work."
                  "Elevate your casual style with our premium men's t-shirt.Elevate your casual style with our premium men's t-shirt. Crafted for comfort and designed with a modern fit, this versatile shirt is an essential addition to your wardrobe."
                  "Crafted for comfort and designed with a modern fit, this versatile shirt is an essential addition to "
                  "your wardrobe.",
            ),
          ],
        ),
      ),
    );
  }}