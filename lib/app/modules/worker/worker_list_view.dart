import 'package:flutter/material.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';


class WorkerListPage extends BaseView<ServiceController> {
  WorkerListPage({super.key});
  final List<Worker> workers = [
    Worker(name: 'Samia Farhana Sumi', gender: 'Female', country: 'Mirpur', age: 43, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 16),
    Worker(name: 'AIBE', gender: 'Female', country: 'Gulshan', age: 28, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 22),
    Worker(name: 'MARY ', gender: 'Female', country: 'Uttara', age: 36, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 25),
    Worker(name: 'Jane', gender: 'Female', country: 'Banani', age: 29, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 15),
    Worker(name: 'Tamima', gender: 'Female', country: 'Banani', age: 29, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 27),
    Worker(name: 'Taslima', gender: 'Female', country: 'Banani', age: 29, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 14),
    Worker(name: 'Suborna', gender: 'Female', country: 'Banani', age: 29, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 27),
    Worker(name: 'Samia', gender: 'Female', country: 'Banani', age: 29, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 29),
    Worker(name: 'Akter', gender: 'Female', country: 'Banani', age: 29, fee: 15000, imagePath: 'assets/jarin.jpg', taskCompleted: 13),
    // Add more workers if needed
  ];


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return AppBar(
     title: Text('Domestic Workers'),
     leading: IconButton(
       icon: Icon(Icons.arrow_back),
       onPressed: () {
         Navigator.pop(context);
       },
     ),
   );
  }

  @override
  Widget body(BuildContext context) {
    final size=MediaQuery.of(context).size;
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 14.0),
     child: GridView.builder(
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         childAspectRatio: 0.7, // Adjust the aspect ratio based on your design
       ),
       itemCount: workers.length,
       itemBuilder: (context, index) {
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
                   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                   child: Center(
                     child: Image.asset(
                       worker.imagePath,
                       height:size.height * 0.1,
                       width: size.width * 0.1,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 Center(
                   child: Text(
                     worker.name,
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                   ),
                 ),
                 SizedBox(height: size.height * 0.01,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     const Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // const Text('Gender:'),
                         Text('Area:'),
                         Text('Age:'),
                         Text('Completed:'),
                         // Text('Fee:'),
                       ],
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // Text(worker.gender),
                         Text(worker.country),
                         Text('${worker.age}'),
                         Text('${worker.taskCompleted} Task'),
                         // Text('${worker.fee} Tk'),
                       ],
                     ),
                   ],
                 ),
                 SizedBox(height: size.height * 0.02,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(
                       height: size.height *0.035,
                       width: size.width * 0.23,
                       child: ElevatedButton(onPressed: (){},
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.green,
                           ),
                           child: const Text('Proceed',style: TextStyle(fontSize: 12,color: Colors.white),)),
                     )
                     // ,SizedBox(
                     // height: size.height *0.025,
                     //  width: size.width * 0.2,
                     //   child: ElevatedButton(onPressed: (){},
                     //       child: Text('View',style: TextStyle(fontSize: 10,color: Colors.green),)),
                     // ),
                   ],
                 )
               ],
             ),
           ),
         );
       },
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
