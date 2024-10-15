import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';
import '../../../../utils/helper_function.dart';
import '../model/service_list_model.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String image;
  final ServiceModel service;
  const ServiceCard(
      {super.key,
      required this.title,
      required this.image,
      required this.service});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  '${Constants.serviceImgUrl}$image',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "(starting with)",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${Constants.banglaCurrency}"
                                "${getDiscountAmount(service.serviceDiscount,service.servicePrice!)} ",
                            style: const TextStyle(
                                fontSize: 18,
                                color: LightThemeColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          service.serviceDiscount?.discount==0 ?  const SizedBox():Text(
                            "${service.servicePrice} ",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          // const Text(
                          //   "(starting with)",
                          //   style: TextStyle(
                          //       fontSize: 11,
                          //       color: Colors.black45,
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.035,
                        width: size.width * 0.35,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppPages.ServiceBooking,
                                  arguments: service);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: LightThemeColors.primaryColor,
                            ),
                            child: const Text(
                              'Reserve Service',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            )),
                      )
                      // ,SizedBox(
                      // height: size.height *0.03,
                      //  width: size.width * 0.2,
                      //   child: ElevatedButton(onPressed: (){
                      //     Navigator.push(context, MaterialPageRoute(builder: (_)=>ServiceDetailsScreen()));
                      //   },
                      //       child: Text('Details',style: TextStyle(fontSize: 10,color: Colors.green),)),
                      // ),
                    ],
                  )),
              const SizedBox(height: 10),
            ],
          ),
          service.serviceDiscount!.discount.toString()!='0'?
          Positioned(
              top: 10,
              right: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.85),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))
                ),
                height: 20,
                width: 80,
                child: Text(
                  textAlign: TextAlign.center,
                    '${service.serviceDiscount!.discount}'
                        '${service.serviceDiscount!.discountType == "Percentage Discount" ? '%' : Constants.banglaCurrency} OFF',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
              )):const SizedBox()
        ],
      ),
    );
  }
}
