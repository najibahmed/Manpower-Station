import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/modules/worker/view/worker_review_card.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';
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
    WorkerModel worker=Get.arguments;
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: LightThemeColors.primaryColor,
              centerTitle: true,
              title: Image.asset(
                'assets/images/manpower_name_logo.png',
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:BorderRadius.circular(15),
                      child: SizedBox(
                        width: screenWidth * 0.6, // 60% of screen width
                        height: screenHeight * 0.25, // 30% of screen height
                        child: CachedNetworkImage(
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
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "${worker.username}",
                      style: const TextStyle(
                        fontSize: 26,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: worker.ratings! .toDouble() ,
                          minRating: 0.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ), onRatingUpdate: (double value) {  },
                        ),
                        Text("(${worker.ratings!})",style: const TextStyle(
                          fontSize: 18
                        ),),
                      ],
                    ),
                     SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Area:  ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${worker.area}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                           SizedBox(width: screenHeight*.01 ),
                          Row(
                            children: [
                              const Text(
                                'Address:  ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),Text(
                                '${worker.address}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Gender:  ',
                                style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              Text(
                                '${worker.gender}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                           SizedBox(width: screenHeight*.01),
                          const SizedBox(height: 10),
                          const Text(
                            'Profile Description  ',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            '${worker.profileDescription}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Working Area',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Wrap(
                            children:
                                List.generate(worker.services!.length, (index) {
                              var services = worker.services![index];
                              return Chip(
                                  elevation: 5,
                                  label: Row(
                                    children: [
                                      Text(
                                        '${services.service!.name}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.green[100]);


                                Text('${services.service!.name}, ',
                                  style: const TextStyle(fontSize: 16));
                            }),
                          ),
                          // Center(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10.0),
                          //     child: SizedBox(
                          //       width: screenWidth*0.5,
                          //       child: ElevatedButton.icon(
                          //               icon: const Icon(Icons.file_download,color: Colors.white,),
                          //               label: const Text('Download CV',style: TextStyle(color: Colors.white),),
                          //               onPressed: () {},
                          //               style: ElevatedButton.styleFrom(
                          //                 padding: EdgeInsets.symmetric(horizontal: 30,), // padding
                          //                 minimumSize: Size(200, 50), // minimum size
                          //               ),
                          //               ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                     const Divider(thickness: 1,color: Colors.black26,),
                     const Center(
                       child: Text(
                         "Reviews",
                         style: TextStyle(
                           color: Colors.black87,
                           fontSize: 20,
                           letterSpacing: 1,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                    SizedBox(height: screenHeight * 0.01),
                    worker.services!.isEmpty
                        ? const Text("There is no review")
                        : Column(
                            children: List.generate(
                              worker.services!.first.service!.reviews!.length,
                            (index) {
                              var review = worker
                                  .services!.first.service!.reviews![index];

                              return WorkerReviewCard(review: review);
                            },
                          )),
                     SizedBox(height: screenHeight * .1),
                  ],
                ),
              ),
            )
          ]),
          Positioned(
            bottom: 5,
            left: 40,
            right: 40,
            child: Card(
              elevation: 9,
              // color: Colors.green.withOpacity(.85),
              child: SizedBox(
                height: screenHeight * .05,
                width: screenWidth * .6,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: const Text('Reserve Worker',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (controller.selectedWorkerList.isNotEmpty) {
                      controller.selectedWorkerList.clear();
                    }
                    if (controller.selectedWorkerList.isEmpty) {
                      Get.offNamed(AppPages.CheckoutScreen);
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
