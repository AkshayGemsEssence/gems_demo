import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  DateTime dateTime = DateTime.now();
  DateTime endDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${dateTime.day}/${dateTime.month}/${dateTime.year}"),
          Text("${endDateTime.day}/${endDateTime.month}/${endDateTime.year}"),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (c) => AlertDialog(
                  title: Text("Are you sure?"),
                ),
              );
            },
            child: Text("On Dialog Show"),
          ),
          TextButton(
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022, 1, 1),
                lastDate: DateTime(2026, 12, 31),
                initialDatePickerMode: DatePickerMode.day,
                confirmText: "Leave Date",
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                switchToCalendarEntryModeIcon: Icon(Icons.access_alarms),
              );
              print("selectedDate:: has selected ${selectedDate != null}");
              if (selectedDate != null) {
                dateTime = selectedDate;
                setState(() {});
                print("selectedDate:: has selected ${selectedDate.year}");
                print("selectedDate:: has selected ${selectedDate.day}");
                print("selectedDate:: has selected ${selectedDate.month}");
                print("selectedDate:: has selected ${selectedDate.weekday}");
              }
            },
            child: Text("Date Picker"),
          ),
          TextButton(
            onPressed: () async {
              DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2022, 1, 1),
                lastDate: DateTime(2026, 12, 31),
              );
              if (dateTimeRange != null) {
                print("date has Selected");
                dateTime = dateTimeRange.start;
                endDateTime = dateTimeRange.end;
                setState(() {});
              } else {
                print("Not Selected");
              }
            },
            child: Text("Date Picker"),
          ),
          TextButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.green,
                        width: 1,
                      )),
                  behavior: SnackBarBehavior.floating,
                  dismissDirection: DismissDirection.up,
                  margin: EdgeInsets.only(bottom: 60),
                  showCloseIcon: true,
                  content: Text("Wrong Mobile Number on database"),
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.all(12),
                  elevation: 1,
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: Text("SnackBar"),
          ),
          TextButton(
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                builder: (c) {
                  return Container(
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48),
                        ),
                        color: Colors.green),
                  );
                },
              );
            },
            child: Text("bottomSheet"),
          ),
          TextButton(
            onPressed: () async {
              TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time!=null) {
                print("time: ${time.hour}");
                print("time: ${time.minute}");
                print("time: ${time.period}");
              }
            },
            child: Text("time picker"),
          ),
          TextButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Select Year"),
                    content: Container( // Need to use container to add size constraint.
                      width: 300,
                      height: 300,
                      child: YearPicker(
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2024),
                        selectedDate: DateTime.now(),
                        onChanged: (DateTime dateTime) {
                          print("dateTime:: ${dateTime.year}");
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Text("Year"),
          ),
        ],
      ),
    );
  }
}
