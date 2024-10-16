import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';

class WorkerListScreen extends BaseView<WorkerController> {
  WorkerListScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: Image.asset(
              'assets/images/manpower_name_logo.png',
              fit: BoxFit.cover,
              color: Colors.white,
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      /// Worker Search Bar
                      child: TextField(
                        controller: controller.workerSearchController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          hintText: 'Search Worker',
                          filled: true,
                          isDense: true,
                          prefixIcon: const Icon(Icons.search_outlined),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                        ),
                        onChanged: (query) {
                          controller.deBouncer.call(() {

                            controller.isLoading.value = true;
                            controller.findWorkers();
                            Future.delayed(
                                const Duration(
                                  seconds: 1,
                                ), () {
                              controller.isLoading.value = false;
                            });
                          });
                        },
                      ),
                    ),
                  ),
                )),
          ),

          /// Worker list Widget
          // controller.findByWorker.isEmpty? SliverPadding(
          //   padding: const EdgeInsets.all(10),
          //   sliver: SliverGrid(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //       childAspectRatio: 0.75 // Adjust the aspect ratio based on your design
          //     ),
          //     delegate: SliverChildBuilderDelegate(
          //       childCount: controller.allWorkerList.isEmpty
          //           ? 6
          //           : controller.allWorkerList.length,
          //           (context, index) {
          //         if (controller.allWorkerList.isEmpty) {
          //           return _buildServiceCardShimmer();
          //         } else {
          //           WorkerModel
          //           worker = controller.allWorkerList[index];
          //           return InkWell(
          //             onTap: (){
          //               Get.toNamed(AppPages.WorkerDetails,arguments: worker);
          //             },
          //             child: Card(
          //               elevation: 4,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                           horizontal: 8.0, vertical: 4),
          //                       child: Center(
          //                         child: Image.network(
          //                           '${Constants.avatarImgUrl}${worker
          //                               .avatar}',
          //                           height: size.height * 0.1,
          //                           width: size.width * 0.1,
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     Center(
          //                       child: Text(
          //                         worker.username!,
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold, fontSize: 14),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: size.height * 0.01,
          //                     ),
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                       children: [
          //                         const Text('Gender:',style: TextStyle(
          //                           color: Colors.grey
          //                         ),),
          //                         Text('${worker.gender}',style: const TextStyle(
          //                           color: Colors.black54,
          //                           fontWeight: FontWeight.bold
          //                         ),),
          //                       ],
          //                     ),
          //                     RatingBar.builder(
          //                       itemSize: 22,
          //                       initialRating: worker.ratings! .toDouble() ,
          //                       minRating: 0.0,
          //                       direction: Axis.horizontal,
          //                       allowHalfRating: true,
          //                       ignoreGestures: true,
          //                       itemCount: 5,
          //                       itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          //                       itemBuilder: (context, _) => const Icon(
          //                         Icons.star,
          //                         color: Colors.amber,
          //                       ), onRatingUpdate: (double value) {  },
          //                     ),
          //                     SizedBox(
          //                       height: size.height * 0.02,
          //                     ),
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         SizedBox(
          //                           height: size.height * 0.035,
          //                           width: size.width * 0.23,
          //                           child: ElevatedButton(
          //                               onPressed: () {
          //                                 if(controller.selectedWorkerList.isNotEmpty){
          //                                   controller.selectedWorkerList.clear();
          //                                 }
          //                                 if (controller.selectedWorkerList.length < 1) {
          //                                   Get.toNamed(AppPages.CheckoutScreen);
          //                                   controller.addWorker(worker);
          //                                 }
          //
          //                               },
          //                               style: ElevatedButton.styleFrom(
          //                                 backgroundColor:
          //                                 LightThemeColors.primaryColor,
          //                               ),
          //                               child: const Text(
          //                                 'Proceed',
          //                                 style: TextStyle(
          //                                     fontSize: 12, color: Colors.white),
          //                               )),
          //                         )
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           );
          //         }
          //       },
          //     ),
          //   ),
          // ):
          /// Worker list Widget
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      0.75 // Adjust the aspect ratio based on your design
                  ),
              delegate: SliverChildBuilderDelegate(
                childCount: controller.isLoading.value
                    ? 4
                    : controller.findByWorker.length,
                (context, index) {
                  if (controller.isLoading.value) {
                    return _buildServiceCardShimmer();
                  } else {
                    WorkerModel worker = controller.findByWorker[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppPages.WorkerDetails, arguments: worker);
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Center(
                                  child: CachedNetworkImage(
                                    height: size.height * 0.1,
                                    width: size.width * 0.1,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        '${Constants.avatarImgUrl}${worker.avatar}',
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        value: progress.progress,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  worker.username!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Gender:',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    '${worker.gender}',
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    itemSize: 22,
                                    initialRating: worker.ratings!.toDouble(),
                                    minRating: 0.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double value) {},
                                  ),
                                  Text(
                                    " ${worker.ratings!}⭐",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.035,
                                    width: size.width * 0.23,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (controller
                                              .selectedWorkerList.isNotEmpty) {
                                            controller.selectedWorkerList
                                                .clear();
                                          }
                                          if (controller
                                                  .selectedWorkerList.length <
                                              1) {
                                            Get.toNamed(
                                                AppPages.CheckoutScreen);
                                            controller.addWorker(worker);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              LightThemeColors.primaryColor,
                                        ),
                                        child: const Text(
                                          'Select Worker',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCardShimmer() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: const Column(
        children: [
          ShimmerWidget.rectangular(height: 120),
          SizedBox(
            height: 10,
          ),
          ShimmerWidget.rectangular(
            height: 20,
            width: 110,
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                  alignment: Alignment.center,
                  child: ShimmerWidget.rectangular(
                    height: 20,
                    width: 150,
                  ))),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
