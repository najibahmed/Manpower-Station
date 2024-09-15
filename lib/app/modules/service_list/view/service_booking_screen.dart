import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service_list/controller/service_controller.dart';
import 'package:manpower_station/app/modules/service_list/model/service_list_model.dart';
import 'package:manpower_station/app/modules/service_list/view/basic_calendar.dart';
import 'package:manpower_station/app/modules/service_list/view/table_calender.dart';


class ServiceBookingScreen extends BaseView<ServiceController> {
   ServiceBookingScreen({super.key,});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  DateFormat format = DateFormat('dd/MMM/yyyy');
  var time=[3,4,5,6,7,8];

  @override
  Widget body(BuildContext context) {
    // final ServiceModel service = Get.arguments;
    // TODO: implement body
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Your Service Section
          const Text(
            'Home Cleaning',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/jarin.jpg', // Placeholder for the image
            height: 150,
            width: double.infinity,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            hint: const Text('Select Your Time'),
            value: controller.selectedTime.value,
            items: time.map((int time) {
              return DropdownMenuItem<int>(
                value: time,
                child: Text('$time'),
              );
            }).toList(),
            onChanged: (value) {
              controller.selectedTime.value=value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            hint: const Text('Select Your Time Key'),
            value: controller.selectedTimeKey.value,
            items: ['hours', 'days', 'weeks','months'].map((String key) {
              return DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              );
            }).toList(),
            onChanged: (value) {
              controller.selectedTimeKey.value=value!;
            },
          ),
          const SizedBox(height: 16),
          controller.selectedTimeKey.value=='weeks'|| controller.selectedTimeKey.value=='hours' ?
          TableBasicsExample():
          controller.selectedTimeKey.value =='days' ? DateRangeCalendar(rangeLength: controller.selectedTime.value,):
          SizedBox(),
          // Text(
          //   'Select Work Start Time',
          //   style: TextStyle(color: Colors.red),
          // ),
          const SizedBox(height: 16),
          Divider(thickness: 1,height: 5,),
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Add remove service logic
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.green,
          //     ),
          //     child: const Text('Remove Service',style: TextStyle(color: Colors.white),),
          //   ),
          // ),

          const SizedBox(height: 32),

          // Your Information Section
          const Text(
            'Your Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'house No./road No.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Area',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Thana',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Post Code',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>WorkerListPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Book Service',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}

