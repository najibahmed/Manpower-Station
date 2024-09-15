import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/home/controllers/home_controller.dart';
import 'package:manpower_station/app/modules/service_list/controller/service_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import '../model/service_list_model.dart';

// class ServiceListView extends BaseView<ServiceController> {
//   ServiceListView({super.key});
//   @override
//   PreferredSizeWidget? appBar(BuildContext context) {
//     return AppBar(
//       title: const Text('Service List'),
//     );
//   }
//
//   @override
//   Widget body(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 0.9,
//         ),
//         itemCount: controller.serviceData.length,
//         itemBuilder: (context, index) {
//           ServiceModel service = controller.serviceData[index];
//           return InkWell(
//             onTap: (){
//               Get.toNamed(AppPages.ServiceDetails,arguments:service);
//             },
//             child: ServiceCard(
//               title: service.name!,
//               image: service.image!,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class ServiceCard extends StatelessWidget {
  final String title;
  final String image;

  const ServiceCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child:Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Hero(
              tag: title,
              child: Image.network(
                'http://172.16.154.43/images/services/${image}',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
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
                    width: size.width * 0.4,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppPages.ServiceBooking,);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
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
