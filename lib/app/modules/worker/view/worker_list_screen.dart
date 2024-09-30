import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/models/cart_model.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';

class WorkerListScreen extends BaseView<WorkerController> {
  WorkerListScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            bottom: PreferredSize(preferredSize: const Size.fromHeight(60),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          // showSearch(
                          //     useRootNavigator: true,
                          //     query: '',
                          //     context: context,
                          //     delegate: _itemSearchDelegate());
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.25),
                            borderRadius: BorderRadius.circular(20),
                            // border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search_outlined,
                                color: Colors.black54,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.black54,
                                  // letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),

          /// Search Bar
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: InkWell(
          //         onTap: () {
          //           // showSearch(
          //           //     useRootNavigator: true,
          //           //     query: '',
          //           //     context: context,
          //           //     delegate: _itemSearchDelegate());
          //         },
          //         child: Container(
          //           height: 40,
          //           decoration: BoxDecoration(
          //             color: Colors.grey.withOpacity(.25),
          //             borderRadius: BorderRadius.circular(20),
          //             // border: Border.all(width: 1, color: Colors.black),
          //           ),
          //           child: const Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Icon(
          //                 Icons.search_outlined,
          //                 color: Colors.black54,
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Text(
          //                 'Search',
          //                 style: TextStyle(
          //                   color: Colors.black54,
          //                   // letterSpacing: 1,
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          /// Worker list Widget
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                0.7, // Adjust the aspect ratio based on your design
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: controller.isLoading.value
                    ? 6
                    : controller.allWorkerList.length,
                    (context, index) {
                  if (controller.isLoading.value) {
                    return _buildServiceCardShimmer();
                  } else {
                    WorkerModel
                    worker = controller.allWorkerList[index];
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppPages.WorkerDetails,arguments: worker);
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Center(
                                  child: Image.network(
                                    'http://172.16.154.43/images/avatars/${worker
                                        .avatar}',
                                    height: size.height * 0.1,
                                    width: size.width * 0.1,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  worker.username!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Area:'),
                                      Text('Gender:'),
                                      Text('Ratings:'),
                                      // Text('Fee:'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(worker.area!),
                                      Text('${worker.gender}'),
                                      Text('${worker.ratings} Stars'),
                                      // Text('${worker.fee} Tk'),
                                    ],
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
                                          if (controller.selectedWorkerList
                                              .length == 1) {
                                            return
                                              controller.addWorker(worker);
                                          }
                                          print('-----selected worker list---->${controller.selectedWorkerList.first.toJson()}');
                                          Get.toNamed(AppPages.CheckoutScreen);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          LightThemeColors.primaryColor,
                                        ),
                                        child: const Text(
                                          'Proceed',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
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

  final categoryList = [
    "Home Cleaning",
    "Office Cleaning",
    "Cloth Washing",
    "Printer Service",
    "Desktop Service",
    "Laptop Service",
    "Over Service",
    "Commercial Shifting",
    "Painting Service",
    "Carpentry Service",
    "CCTv Camera Service",
    "Driver Service",
    "Car Wash",
  ];
}