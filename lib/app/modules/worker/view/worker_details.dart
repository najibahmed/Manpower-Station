import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/modules/worker/view/worker_review_card.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import '../../../models/worker_model.dart';

class WorkerDetailsScreen extends BaseView<WorkerController> {
  const WorkerDetailsScreen({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return null;
  }

  @override
  Widget body(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    WorkerModel worker = Get.arguments;
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: LightThemeColors.primaryColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black26,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
              sliver: SliverToBoxAdapter(
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
                            'Area: ${worker.area}',
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
                            'Rating: ${worker.ratings} Stars',
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
                          Wrap(
                            children:
                                List.generate(worker.services!.length, (index) {
                              var services = worker.services![index];
                              return Text('${services.service!.name}, ',
                                  style: const TextStyle(fontSize: 16));
                            }),
                          ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: screenWidth*0.5,
                            child: ElevatedButton.icon(
                                    icon: const Icon(Icons.file_download,color: Colors.white,),
                                    label: const Text('Download CV',style: TextStyle(color: Colors.white),),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 30,), // padding
                                      minimumSize: Size(200, 50), // minimum size
                                    ),
                                    ),
                          ),
                        ),
                      ),
                        ],
                      ),
                    ),
                    worker.services!.isEmpty
                        ? const Text("There is no review")
                        : Column(
                            children: List.generate(
                            worker.services!.first.service!.reviews!.length,
                            (index) {
                              var review = worker.services!.first.service!.reviews![index];

                              return WorkerReviewCard(review: review);
                            },
                          )),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ]),
          Positioned(
            bottom: 5,
            right: 5,
            left: 5,
            child: Card(
              elevation: 9,
              // color: Colors.green.withOpacity(.85),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .9,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle_outline,color: Colors.white,),
                  label: const Text('Proceed',style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if(controller.selectedWorkerList.isNotEmpty){
                      controller.selectedWorkerList.clear();
                    }
                    if (controller.selectedWorkerList.isEmpty) {
                      Get.toNamed(AppPages.CheckoutScreen);
                      controller.addWorker(worker);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
