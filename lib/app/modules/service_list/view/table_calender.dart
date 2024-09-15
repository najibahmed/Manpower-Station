import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DateRangeCalendar extends StatefulWidget {
  final rangeLength;
  const DateRangeCalendar({super.key,required this.rangeLength});

  @override
  _DateRangeCalendarState createState() => _DateRangeCalendarState();
}

class _DateRangeCalendarState extends State<DateRangeCalendar> {
  DateTime? _selectedDate;
  List<DateTime> _highlightedDates = [];
  DateFormat format = DateFormat('dd/MMM/yyyy');

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
      _highlightedDates = _calculateDateRange(selectedDay);
    });
  }

  List<DateTime> _calculateDateRange(DateTime selectedDate) {
    // const  rangeLength=4;
     // Range of 7 days before the selected date
    return List<DateTime>.generate(
     widget.rangeLength,
      (index) => selectedDate.add(Duration(days: index)),
    );
  }
  var _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Text("From which date you want to start your Service?"),
        TableCalendar(
          weekNumbersVisible: false,
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          firstDay: DateTime.now().add(Duration(days: 1)),
          lastDay: DateTime(2025),
          focusedDay: _selectedDate ?? DateTime.now().add(Duration(days: 1)),
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
                  border: Border.all(
                      color: Colors.grey
                  ),

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
          const SizedBox(height: 20),
          Text('Selected Date: ${format.format(_selectedDate!)}'),
          const Text('Highlighted Date Range:'),
          Text("${format.format(_highlightedDates.first)} to ${format.format(_highlightedDates.last)}")
          // for (var date in _highlightedDates) Text(date.toString()),
        ]
      ],
    );
  }
}
