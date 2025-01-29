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
import 'package:manpower_station/utils/app_Images.dart';
import 'package:manpower_station/utils/constants.dart';

class WorkerListScreen extends BaseView<WorkerController> {
  const WorkerListScreen({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        AppImages.instance.manpower_Logo,
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
              color: LightThemeColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
            child: TextField(
              controller: controller.workerSearchController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.green,
              style: const TextStyle(fontWeight: FontWeight.normal),
              decoration: const InputDecoration(
                // fillColor: Colors.grey[300],
                hintText: 'Search Worker',
                filled: true,
                fillColor: Color(0xFFF5FCF9),
                isDense: true,
                prefixIcon: Icon(Icons.search_outlined),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.0 * 1.5, vertical: 12.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              onChanged: (query) {
                controller.deBouncer.call(() {
                  // controller.isLoading.value = true;
                  controller.findByWorker.value=[];
                  controller.findWorkers();
                  // Future.delayed(
                  //     const Duration(
                  //       seconds: 1,
                  //     ), () {
                  //   controller.isLoading.value = false;
                  // });
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
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
                childCount: controller.findByWorker.isEmpty
                    ? 4
                    : controller.findByWorker.length,
                (context, index) {
                  if (controller.findByWorker.isEmpty) {
                    return _buildServiceCardShimmer();
                  } else {
                    WorkerModel worker = controller.findByWorker[index];
                    return controller.findByWorker.isEmpty
                        ? const Center(
                            child: Text("No worker found!"),
                          )
                        : InkWell(
                            onTap: () {
                              Get.toNamed(AppPages.WorkerDetails,
                                  arguments: worker);
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
                                               Image.asset(AppImages.instance.imgPerson,fit: BoxFit.cover,),
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  Center(
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
                                          worker.gender??"Empty",
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 22,
                                          initialRating:
                                              worker.ratings!.toDouble(),
                                          minRating: 0.0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          ignoreGestures: true,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GetX<WorkerController>(
                                            builder: (wController) {
                                          final isSelected =
                                              controller.isWorkerSelected(
                                                  worker.user!.id!);
                                          return SizedBox(
                                            height: size.height * 0.035,
                                            width: size.width * 0.29,
                                            child: OutlinedButton.icon(
                                                onPressed: () {
                                                  if (!isSelected) {
                                                    controller.selectedWorkerList.clear();
                                                    if (controller.selectedWorkerList.isEmpty) {
                                                      Get.toNamed(AppPages.CheckoutScreen);
                                                      controller.addWorker(worker);
                                                    }
                                                  } else {
                                                    controller.removeWorker(worker.user!.id);
                                                  }
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(),
                                                  backgroundColor: isSelected
                                                      ? Colors.red[100]
                                                      : controller
                                                              .isLightMode.value
                                                          ? Colors.white70
                                                          : Colors.white,
                                                ),
                                                icon: Icon(
                                                  isSelected
                                                      ? Icons
                                                          .remove_circle_outline
                                                      : Icons.add,
                                                  color: Colors.black,
                                                ),
                                                label: Text(
                                                  isSelected
                                                      ? "Remove"
                                                      : 'Select ',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                )),
                                          );
                                        })
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
