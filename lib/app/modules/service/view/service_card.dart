import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              'http://172.16.154.43/images/services/$image',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                          'Book',
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
    );
  }
}
