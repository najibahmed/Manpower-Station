// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ServiceBookingScreen extends BaseView<ServiceController> {
  const ServiceBookingScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * .01),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: Image.network(
                          '${Constants.serviceImgUrl}${controller.serviceModel.image}', // Placeholder for the image
                          height: screenHeight * .22,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: screenHeight * .02),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: screenWidth * .4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Duration',
                                      style: TextStyle(
                                          fontSize: MyFonts.bodyLargeSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(height: screenHeight * .01),
                                    DropdownMenu(
                                      inputDecorationTheme:
                                          const InputDecorationTheme(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      textStyle: const TextStyle(
                                          color: LightThemeColors.primaryColor),
                                      onSelected: (value) {
                                        controller.timeLimit.value = value!;
                                      },
                                      initialSelection:
                                          controller.timeLimit.value,
                                      dropdownMenuEntries:
                                          controller.time.map((time) {
                                        return DropdownMenuEntry<int>(
                                          value: time,
                                          label: '$time',
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )
                                //
                                ),
                            SizedBox(
                              width: screenWidth * .4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        fontSize: MyFonts.bodyLargeSize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(height: screenHeight * .01),
                                  DropdownMenu<String>(
                                    inputDecorationTheme:
                                        const InputDecorationTheme(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    textStyle: const TextStyle(
                                        color: LightThemeColors.primaryColor),
                                    onSelected: (value) {
                                      controller.selectedTimeKey.value = value!;
                                    },
                                    initialSelection:
                                        controller.selectedTimeKey.value,
                                    dropdownMenuEntries: [
                                      'Hours',
                                      'Days',
                                      'Weeks',
                                      'Months'
                                    ].map((String key) {
                                      return DropdownMenuEntry<String>(
                                        value: key,
                                        label: key,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * .01),
                      Divider(
                        thickness: 1,
                        height: 5,
                        color: Colors.grey.withOpacity(.52),
                      ),
                      SizedBox(height: screenHeight * .01),
                      Text(
                        'Choose a start time to begin with.',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: MyFonts.bodyLargeSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: screenHeight * .01),
                      Card(
                        color: Colors.grey[100],
                        elevation: 3,
                        child: SizedBox(
                          height: screenHeight * 0.08,
                          width: double.infinity,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Date-Time:',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: MyFonts.bodyLargeSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    Constants.formatDateTime.format(
                                        controller.selectedDateTime.value!),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: MyFonts.bodyLargeSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * .01),
                      Center(
                          child: SizedBox(
                        height: screenHeight * .06,
                        width: 200,
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              bool themeIsLight =
                                  MySharedPref.getThemeIsLight();
                              controller.selectedDateTime.value =
                                  await showOmniDateTimePicker(
                                separator: const Column(
                                  children: [
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Text("Scroll to Select Time"),
                                  ],
                                ),
                                theme: ThemeData(
                                    colorScheme: ColorScheme.light(
                                  primary: LightThemeColors
                                      .primaryColor, // header color
                                  onPrimary: Colors.white, // text color
                                  surface:
                                      Colors.grey[50]!, // background color
                                )),
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
                            },
                            label: const Text(
                              "Select Schedule",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            )),
                      )),
                      SizedBox(height: screenHeight * .02),
                      Divider(
                        thickness: 1,
                        height: 5,
                        color: Colors.grey.withOpacity(.52),
                      ),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                      Text(
                        'Move on to the Worker selection process.',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: MyFonts.bodyLargeSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            controller.showLoading();
                            controller.selectedService =
                                controller.serviceModel;
                            controller.addToCartList();
                            controller.hideLoading();
                            Get.toNamed(AppPages.WorkerListView);
                          },
                          child: Card(
                            color: LightThemeColors.primaryColor,
                            elevation: 5,
                            child: SizedBox(
                              height: screenHeight * 0.06,
                              width: screenWidth * 0.5,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Choose Worker",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MyFonts.bodyLargeSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            right: 5,
            left: 5,
            child: Card(
              color: Colors.grey[100],
              elevation: 5,
              // color: Colors.green.withOpacity(.85),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'SUB TOTAL:    ',
                          style: TextStyle(
                              fontSize: MyFonts.bodyLargeSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          children: [
                            TextSpan(
                              text:
                                  '${Constants.banglaCurrency} ${controller.getServicePrice(controller.timeLimit.value, controller.selectedTimeKey, controller.serviceModel.servicePrice)}.00',
                              style: TextStyle(
                                  fontSize: MyFonts.bodyLargeSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
