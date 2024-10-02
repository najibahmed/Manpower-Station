// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ServiceBookingScreen extends BaseView<ServiceController> {
  ServiceBookingScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    // final ServiceModel service = Get.arguments;
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
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
                title: Text(
                  '${controller.serviceModel.name}',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: Image.network(
                          'http://172.16.154.43/images/services/${controller.serviceModel.image}', // Placeholder for the image
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Select Your Time',
                        style: TextStyle(
                            fontSize: MyFonts.bodyLargeSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
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
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  filled: true,
                                  // fillColor: Colors.grey,
                                ),
                                hint: const Text('Select Your Time'),
                                value: controller.timeLimit.value,
                                items: controller.time.map((time) {
                                  return DropdownMenuItem<int>(
                                    value: time,
                                    child: Text('$time'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  controller.timeLimit.value = value!;
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
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  filled: true,
                                  // fillColor: Colors.grey,
                                ),
                                hint: const Text('Select Your Time Key'),
                                value: controller.selectedTimeKey.value,
                                items: ['Hours', 'Days', 'Weeks', 'Months']
                                    .map((String key) {
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
                      Center(
                        child: CustomButton(
                          title: "Select Schedule",
                          height: 40,
                          width: 200,
                          onTap: () async {
                            controller.selectedDateTime.value =
                                await showOmniDateTimePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                              is24HourMode: false,
                              isShowSeconds: false,
                              minutesInterval: 1,
                              secondsInterval: 1,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              constraints: const BoxConstraints(
                                maxWidth: 400,
                                maxHeight: 650,
                              ),
                              barrierDismissible: true,
                            );
                            print(controller.selectedDateTime.value);
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                          elevation: 5,
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    'Selected Date:   ${Constants.formatDate.format(controller.selectedDateTime.value!)}'),
                              ),
                            ),
                          )),
                      const SizedBox(height: 16),
                      // TableBasicsExample(),
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
                      const SizedBox(
                        height: 90,
                      ),
                      Center(
                          child: CustomButton(
                              title: "Choose Worker",
                              height: 40,
                              width: 200,
                              onTap: () {
                                controller.selectedService =
                                    controller.serviceModel;
                                controller.addToCartList();
                                Get.toNamed(AppPages.WorkerListView);
                              }))
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 5,
            right: 5,
            left: 5,
            child: Card(
              elevation: 9,
              // color: Colors.green.withOpacity(.85),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'SUB TOTAL:  ',
                          style: TextStyle(
                              fontSize: MyFonts.bodyLargeSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          children: [
                            TextSpan(
                              text:
                                  '${controller.getServicePrice(controller.timeLimit.value,
                                      controller.selectedTimeKey, controller.serviceModel.servicePrice)}${Constants.banglaCurrency}',
                              style: TextStyle(
                                  fontSize: MyFonts.bodyLargeSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
