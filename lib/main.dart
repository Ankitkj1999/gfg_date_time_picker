import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  const DateTimePickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const TimeScreen(),
    );
  }
}

class TimeScreen extends StatefulWidget {
  const TimeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  DateTime? datePicker;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = true;
  bool showTime = true;
  bool showDateTime = true;

  // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  // Select for Date
  Future<DateTime?> _datePicker(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: datePicker ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != datePicker) {
      setState(() {
        datePicker = selected;
      });
    }
    return datePicker;
  }

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  // select date time picker

  Future _selectDateTime(BuildContext context) async {
    final date = await _datePicker(context);
    if (date == null) return;
    datePicker = null;
    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('MMMM d, yyyy  \nHH:mm a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showDate
                ? Center(
                    child: Text(
                      getDate(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]),
                    ),
                  )
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                  showDate = true;
                },
                child: const Text('Date Picker'),
              ),
            ),
            const SizedBox(height: 60),
            showTime
                ? Center(
                    child: Text(
                    getTime(selectedTime),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400]),
                  ))
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                  showTime = true;
                },
                child: const Text('Timer Picker'),
              ),
            ),
            const SizedBox(height: 60),
            showDateTime
                ? Center(
                    child: Text(
                    getDateTime(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400]),
                  ))
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () {
                  _selectDateTime(context);
                  showDateTime = true;
                },
                child: const Text(' Date & Time '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
