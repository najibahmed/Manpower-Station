// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/big_text.dart';
import 'package:manpower_station/app/components/custom_snackbar.dart';
import 'package:manpower_station/app/components/gradientBar_widget.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ServiceBookingScreen extends BaseView<ServiceController> {
  ServiceBookingScreen({super.key});

  @override
  Widget? bottomNavigationBar() {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 22, left: 22),
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(.25),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: 'Price', size: MyFonts.bodyMediumSize),
              BigText(
                  text:
                      '${Constants.banglaCurrency} ${controller.selectedTimeKey!.isEmpty ? "00" : controller.getServicePrice(controller.timeLimit.value, controller.selectedTimeKey, controller.serviceModel.servicePrice)}.00',
                  size: MyFonts.bodyLargeSize),
            ],
          ),
          TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  LightThemeColors.primaryColor,
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded button
                  ),
                ),
              ),
              onPressed: () async {
                if (controller.selectedTimeKey!.isNotEmpty) {
                  if (await HelperFunction.instance.isInternetConnected()) {
                    controller.selectedService = controller.serviceModel;
                    controller.addToCartList();
                    Get.toNamed(AppPages.WorkerListView);
                  } else {
                    CustomSnackBar.showCustomErrorToast(
                        title: "No Internet!!",
                        message: "Please check internet connection.");
                  }
                } else {
                  CustomSnackBar.showCustomErrorToast(
                      title: "Field Empty", message: "Please select all field");
                }
              },
              child: const Text(
                'Hire Now',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        // Standard AppBar height
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                LightThemeColors.primaryColor,
                LightThemeColors.secondaryColor
              ],
              // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            title: Text(
              '${controller.serviceModel.name} Service',
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ));
  }

  @override
  Widget body(BuildContext context) {
    final List<String> options = ["months", "days", "weeks"];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // SizedBox(height: screenHeight * .01),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                child: Container(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: screenHeight * .22,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        imageUrl:
                            '${Constants.serviceImgUrl}${controller.serviceModel.image}',
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          color: Colors.black.withOpacity(.3),
                          child: Text(
                            '${controller.serviceModel.name}',
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: screenHeight * 0.02,
                      //   left: screenWidth * 0.03,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey[600]!.withOpacity(.8),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(10))),
                      //     child: Center(
                      //       child: IconButton(
                      //           onPressed: () {
                      //             // Get.offNamed(AppPages.DashboardView);
                      //             Get.back();
                      //           },
                      //           icon: const Icon(
                      //             Icons.arrow_back,
                      //             color: Colors.white,
                      //             size: 22,
                      //           )),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * .02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                        text: 'Select Package Duration',
                        size: MyFonts.bodyLargeSize),
                    controller.selectedTimeKey!.isNotEmpty
                        ? const SizedBox()
                        : Text(
                            "*Required",
                            style: TextStyle(
                                fontSize: 11, color: Colors.red.shade200),
                          ),
                    SizedBox(height: screenHeight * .01),
                    packageDurationChoiceChip(options, context),
                    // durationSegmentedButton(options),
                    durationPeriodDropDown(screenHeight, screenWidth),
                    SizedBox(height: screenHeight * .01),
                    BigText(
                        text: 'Choose a start time to begin with.',
                        size: MyFonts.bodyLargeSize),
                    // Text("*Required",style: TextStyle(fontSize: 11,color: Colors.red.shade200),),
                    SizedBox(height: screenHeight * .01),
                    Card(
                      color: Theme.of(context)
                          .cardColor, // Background color of the card
                      // Colors.grey[100],
                      elevation: 3,
                      child: SizedBox(
                        height: screenHeight * 0.06,
                        width: double.infinity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Date-Time:',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Text(
                                  Constants.formatDateTime.format(
                                      controller.selectedDateTime.value!),
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * .03),

                    /// Calender dialogue
                    ScheduleButton(screenHeight, screenWidth, context),
                    SizedBox(height: screenHeight * .02),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Wrap packageDurationChoiceChip(List<String> options, BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: options.map((option) {
        final bool isDisabled =
            !controller.serviceModel.schedules!.contains(option);
        final bool isSelected = controller.selectedTimeKey!.value == option;
        return ChoiceChip(
          side: const BorderSide(
            color: Colors.green,
          ),
          label: Text(
            option.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isDisabled
                  ? Theme.of(context).textTheme.bodyMedium?.color
                  : isSelected
                      ? Colors.white
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color, // Text color
            ),
          ),
          selected: isSelected,
          onSelected: isDisabled
              ? null // Disable interaction for disabled options
              : (bool selected) {
                  controller.selectedTimeKey!.value = selected ? option : "";
                },
          backgroundColor: Theme.of(context).cardColor,
          // Default background color
          selectedColor: LightThemeColors.primaryColor,
          // Background color when selected
          disabledColor:
              Theme.of(context).hintColor, // Background color when disabled
        );
      }).toList(),
    );
  }

  Center ScheduleButton(
      double screenHeight, double screenWidth, BuildContext context) {
    return Center(
      child: SizedBox(
        height: screenHeight * .055,
        width: screenWidth * 0.8,
        child: ElevatedButton.icon(
          onPressed: () async {
            // bool themeIsLight =
            //     MySharedPref.getThemeIsLight();
            controller.selectedDateTime.value = await showOmniDateTimePicker(
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
                  primary: LightThemeColors.primaryColor, // header color
                  onPrimary: Colors.white, // text color
                  surface: Colors.grey[50]!, // background color
                ),
              ),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2026),
              is24HourMode: false,
              isShowSeconds: false,
              minutesInterval: 1,
              secondsInterval: 1,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
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
          ),
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
        ),
      ),
    );
  }

  SizedBox durationPeriodDropDown(double screenHeight, double screenWidth) {
    return SizedBox(
      // width: screenWidth * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'Select Duration Period', size: MyFonts.bodyLargeSize),
          SizedBox(height: screenHeight * .01),

          /// Drop Down button for selection of time duration
          DropdownMenu(
            width: screenWidth * 0.9,
            menuHeight: screenHeight * .25,
            hintText: "Select Duration",
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
            textStyle: const TextStyle(color: LightThemeColors.primaryColor),
            onSelected: (value) {
              controller.timeLimit.value = value!;
            },
            initialSelection: controller.timeLimit.value,
            dropdownMenuEntries: timeFrequency.map((time) {
              return DropdownMenuEntry<int>(
                value: time,
                label: '$time',
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  SizedBox dropDownPackageDuration(double screenHeight) {
    return SizedBox(
      // width: screenWidth * .4,
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

          /// Drop Down button for selection of time factors
          DropdownMenu<String>(
            hintText: "Select Time",
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
            textStyle: const TextStyle(color: LightThemeColors.primaryColor),
            onSelected: (value) {
              controller.selectedTimeKey!.value = value!;
            },
            // initialSelection:
            //     controller.selectedTimeKey.value,
            dropdownMenuEntries:
                controller.serviceModel.schedules!.map((String key) {
              return DropdownMenuEntry<String>(
                value: key,
                label: key,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Center durationSegmentedButton(List<String> options) {
    return Center(
      child: SegmentedButton<String>(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return LightThemeColors
                  .primaryColor; // Selected button background color
            }
            return Colors.grey[100]; // Unselected button background color
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey[400]; // Custom background for disabled buttons
            }
            if (states.contains(WidgetState.selected)) {
              return Colors.white; // Selected button text color
            }
            return Colors.black54; // Unselected button text color
          }),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
                fontWeight: FontWeight.bold), // Text style for all buttons
          ),
          side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const BorderSide(
                  color: Colors.grey); // Border for disabled buttons
            }
            return const BorderSide(color: Colors.green); // Default border
          }),
        ),
        showSelectedIcon: false,
        segments: options.map((e) {
          return ButtonSegment(
              enabled: controller.serviceModel.schedules!.contains(e),
              value: e.toString(),
              label: Text(e));
        }).toList(),
        selected: {controller.selectedTimeKey!.value},
        onSelectionChanged: (newSelection) {
          controller.selectedTimeKey!.value = newSelection.first;
        },
      ),
    );
  }
}
