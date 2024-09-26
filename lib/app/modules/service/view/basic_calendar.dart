import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBasicsExample extends StatelessWidget {
   TableBasicsExample({super.key});

  DateTime _focusedDay = DateTime.now().add(const Duration(days: 1));

  // DateTime? _selectedDay;
  DateFormat format = DateFormat('dd/MMM/yyyy');

  @override
  Widget build(BuildContext context) {
    final serviceController=Get.put(ServiceController());
    return Obx(()=>
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("From which date you want to start your Service?",style: TextStyle(fontSize: MyFonts.bodyLargeSize, fontWeight: FontWeight.bold, color: Colors.grey)),
          TableCalendar(
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            firstDay: DateTime.now().add(const Duration(days: 1)),
            pageAnimationEnabled: false,
            availableGestures: AvailableGestures.horizontalSwipe,
            lastDay: DateTime(2025),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(serviceController.selectedDay?.value, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(serviceController.selectedDay?.value, selectedDay)) {
                  serviceController.selectedDay?.value = selectedDay;
                  _focusedDay = focusedDay;
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          serviceController.selectedDay?.value==null?const SizedBox(): Text('Selected Date: ${format.format(serviceController.selectedDay!.value)}'),
        ],
      ),
    );
  }
}
