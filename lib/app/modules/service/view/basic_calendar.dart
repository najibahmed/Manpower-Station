import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 1));
  DateTime? _selectedDay;
  DateFormat format = DateFormat('dd/MMM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("From which date you want to start your Service?",style: TextStyle(fontSize: MyFonts.bodyLargeSize,fontWeight: FontWeight.bold)),
        TableCalendar(
          firstDay: DateTime.now().add(const Duration(days: 1)),
          pageAnimationEnabled: false,
          availableGestures: AvailableGestures.horizontalSwipe,
          lastDay: DateTime(2025),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.

            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 20),
        _selectedDay==null?const SizedBox(): Text('Selected Date: ${format.format(_selectedDay!)}'),
      ],
    );
  }
}
