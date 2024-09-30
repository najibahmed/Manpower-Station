import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/service/view/service_reviews.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';

class WorkerDetailsScreen extends BaseView<WorkerController> {
  const WorkerDetailsScreen({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    WorkerModel worker = Get.arguments;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.6, // 60% of screen width
                  height: screenHeight * 0.3, // 30% of screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://172.16.154.43/images/avatars/${worker.avatar}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "${worker.username}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${worker.area}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Gender: ${worker.gender}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Address: ${worker.address}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Rating: ${worker.ratings}Stars',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Profile Description: ${worker.profileDescription}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children:
                            List.generate(worker.services!.length, (index) {
                          var services = worker.services![index];
                          return Text('${services.service!.name}',
                              style: const TextStyle(fontSize: 16));
                        }),
                      ),
                    ],
                  ),
                ),
                worker.reviews!.isEmpty
                    ? const Text("There is no review")
                    : Column(
                        children: List.generate(
                        worker.reviews!.length,
                        (index) {
                          var review = worker.reviews![index];
                          return ReviewCard(review: review);
                        },
                      )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.file_download),
                      label: const Text('CV'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.description),
                      label: const Text('Book'),
                      onPressed: () {
                        if (controller.selectedWorkerList.length == 1) {
                          return controller.addWorker(worker);
                        }
                        print(
                            '-----worker DetailsPage selected worker list---->'
                                '${controller.selectedWorkerList.first.toJson()}');
                        Get.toNamed(AppPages.CheckoutScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
