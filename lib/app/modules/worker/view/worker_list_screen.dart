import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';

class WorkerListScreen extends BaseView<WorkerController>{
   WorkerListScreen({super.key});
  final List<Worker> workers = [
    Worker(
        name: 'Samia Farhana Sumi',
        gender: 'Female',
        country: 'Mirpur',
        age: 43,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 16),
    Worker(
        name: 'AIBE',
        gender: 'Female',
        country: 'Gulshan',
        age: 28,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 22),
    Worker(
        name: 'MARY ',
        gender: 'Female',
        country: 'Uttara',
        age: 36,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 25),
    Worker(
        name: 'Jane',
        gender: 'Female',
        country: 'Banani',
        age: 29,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 15),
    Worker(
        name: 'Tamima',
        gender: 'Female',
        country: 'Banani',
        age: 29,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 27),
    Worker(
        name: 'Taslima',
        gender: 'Female',
        country: 'Banani',
        age: 29,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 14),
    Worker(
        name: 'Suborna',
        gender: 'Female',
        country: 'Banani',
        age: 29,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 27),
    Worker(
        name: 'Samia',
        gender: 'Female',
        country: 'Banani',
        age: 29,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 29),
    Worker(
        name: 'Akter',
        gender: 'Female',
        country: 'Banani',
        age: 29,
        fee: 15000,
        imagePath: 'assets/jarin.jpg',
        taskCompleted: 13),
    // Add more workers if needed
  ];
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // AppBar(
    //   leading: IconButton(onPressed: (){
    //     Get.back();
    //   },
    //       icon: const Icon(
    //         Icons.arrow_back,
    //         color: Colors.white,
    //       )),
    // );
    return null;
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(onPressed: (){
          Get.back();
        },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                0.7, // Adjust the aspect ratio based on your design
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: workers.length,
                    (context, index) {
                  final worker = workers[index];
                  return Card(
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
                              child: Image.asset(
                                worker.imagePath,
                                height: size.height * 0.1,
                                width: size.width * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              worker.name,
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
                                  Text('Age:'),
                                  Text('Completed:'),
                                  // Text('Fee:'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(worker.country),
                                  Text('${worker.age}'),
                                  Text('${worker.taskCompleted} Task'),
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
                                      // Get.toNamed(AppPages.CheckoutScreen);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Worker {
  final String name;
  final String gender;
  final String country;
  final int age;
  final int fee;
  final String imagePath;
  final int taskCompleted;

  Worker({
    required this.name,
    required this.taskCompleted,
    required this.gender,
    required this.country,
    required this.age,
    required this.fee,
    required this.imagePath,
  });
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