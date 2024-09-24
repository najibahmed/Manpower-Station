import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class DateRangeCalendar extends StatefulWidget {
  final rangeLength;
  const DateRangeCalendar({super.key, required this.rangeLength});

  @override
  _DateRangeCalendarState createState() => _DateRangeCalendarState();
}

class _DateRangeCalendarState extends State<DateRangeCalendar> {
  DateTime? _selectedDate;
  List<DateTime> _highlightedDates = [];

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
      _highlightedDates = _calculateDateRange(selectedDay);
    });
  }

  List<DateTime> _calculateDateRange(DateTime selectedDate) {
    final serviceController = Get.find<ServiceController>();
    var selectedList = List<DateTime>.generate(
      widget.rangeLength,
      (index) => selectedDate.add(Duration(days: index)),
    );
    serviceController.highlightedDates.value = selectedList;
    print("------->${serviceController.highlightedDates}");
    return selectedList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("From which date you want to start your Service?",
            style: TextStyle(
                fontSize: MyFonts.bodyLargeSize,
                fontWeight: FontWeight.bold,
                color: Colors.grey)),
        TableCalendar(
          pageJumpingEnabled: true,
          headerStyle: const HeaderStyle(formatButtonVisible: false),
          pageAnimationEnabled: false,
          availableGestures: AvailableGestures.horizontalSwipe,
          firstDay: DateTime.now().add(const Duration(days: 1)),
          lastDay: DateTime(2025),
          focusedDay:
              _selectedDate ?? DateTime.now().add(const Duration(days: 1)),
          selectedDayPredicate: (day) =>
              _selectedDate != null && isSameDay(_selectedDate, day),
          onDaySelected: _onDaySelected,
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              if (_highlightedDates.contains(day)) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              return null;
            },
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
                  color: Colors.blue,
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
        if (_selectedDate != null) ...[
          // const SizedBox(height: 20),
          // Text('Selected Date: ${Constants.formatDate.format(_selectedDate!)}'),
          const Text('Selected Date Range:'),
          Text(
              "${Constants.formatDate.format(_highlightedDates.first)} "
                  "to ${Constants.formatDate.format(_highlightedDates.last)}")
          // for (var date in _highlightedDates) Text(date.toString()),
        ]
      ],
    );
  }
}
