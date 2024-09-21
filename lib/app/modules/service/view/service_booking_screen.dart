
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/modules/service/view/basic_calendar.dart';
import 'package:manpower_station/app/modules/service/view/table_calender.dart';
import 'package:manpower_station/app/modules/worker/worker_list_view.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';

class ServiceBookingScreen extends BaseView<ServiceController> {
  ServiceBookingScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  DateFormat format = DateFormat('dd/MMM/yyyy');
  @override
  Widget body(BuildContext context) {
    final ServiceModel service = Get.arguments;
    // TODO: implement body
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your Service Section
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   IconButton(onPressed: (){
                     Get.back();
                   }, icon: const Icon(Icons.arrow_back)),
                   const SizedBox(width: 20,),
                   Text(
                    '${service.name}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: LightThemeColors.primaryColor),
                             ),
                 ],
               ),
              const SizedBox(height: 8),
              Image.network(
                'http://172.16.154.43/images/services/${service.image}', // Placeholder for the image
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 16),
              Text('Select Your Time',style: TextStyle(fontSize: MyFonts.bodyLargeSize, fontWeight: FontWeight.bold, color: Colors.grey),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 170,
                      child: DropdownButtonFormField<int>(
                        isExpanded: true,
                        elevation: 5,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                          filled: true,
                          // fillColor: Colors.grey,
                        ),
                        hint: const Text('Select Your Time'),
                        value: controller.selectedTime.value,
                        items: controller.time.map((time) {
                          return DropdownMenuItem<int>(
                            value: time,
                            child: Text('$time'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedTime.value = value!;
                        },
                      ),
                    ),
                    // const SizedBox(width: 5),
                    // Text('Select Your Time Key',style: TextStyle(fontSize: MyFonts.bodyLargeSize,fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 170,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                          filled: true,
                          // fillColor: Colors.grey,
                        ),
                        hint: const Text('Select Your Time Key'),
                        value: controller.selectedTimeKey.value,
                        items: ['Hours', 'Days', 'Weeks', 'Months'].map((String key) {
                          return DropdownMenuItem<String>(
                            value: key,
                            child: Text(key),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedTimeKey.value = value!;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              controller.selectedTimeKey.value == 'Weeks' ||
                      controller.selectedTimeKey.value == 'Hours'
                  ? TableBasicsExample()
                  : controller.selectedTimeKey.value == 'Days'
                      ? DateRangeCalendar(
                          rangeLength: controller.selectedTime.value,
                        )
                      : const SizedBox(),
              // Text(
              //   'Select Work Start Time',
              //   style: TextStyle(color: Colors.red),
              // ),
              const SizedBox(height: 16),
              Divider(
                thickness: 1,
                height: 5,
                color: Colors.grey.withOpacity(.52),
              ),
              const SizedBox(height: 32),
              // Center(
              //   child: SizedBox(
              //     height: 40,
              //     width: 170,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Get.toNamed(AppPages.CheckoutScreen,arguments: service);
              //         // Get.to(WorkerListPage());
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.green,
              //       ),
              //       child: Text(
              //         'Book Service',
              //         style: TextStyle(
              //             color: Colors.white, fontSize: MyFonts.buttonTextSize),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          left: 5,
          child: Card(
            elevation: 9,
            // color: Colors.green.withOpacity(.85),
            child: Container(
              height: 60,
              width:MediaQuery.of(context).size.width*.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(text: 'SUB TOTAL:  ',
                        style: TextStyle(fontSize: MyFonts.bodyLargeSize,fontWeight: FontWeight.bold,color: Colors.grey),
                        children:[
                          TextSpan(text: '${controller.getServicePrice(service.servicePrice)}${Constants.banglaCurrency}',
                            style: TextStyle(fontSize: MyFonts.bodyLargeSize,fontWeight: FontWeight.bold,color: Colors.black),)
                        ]
                    ),

                  ),
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.green
                      )
                    ),
                    onPressed:(){
                      Get.toNamed(AppPages.CheckoutScreen,arguments: service);
                    },
                    child:  const Text('CHECKOUT',style: TextStyle(color: Colors.green),),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}