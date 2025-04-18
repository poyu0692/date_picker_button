import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_button/date_picker_button.dart';

void main() {
  runApp(const MaterialApp(home: TestPage()));
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late DateTime time;
  bool isExpandedMonth = false;
  bool isExpandedDate = false;

  @override
  void initState() {
    super.initState();
    time = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DatePickerButton(
                  onTap:
                      () => setState(() => isExpandedMonth = !isExpandedMonth),
                  displayDateTime: time,
                  isExpanded: isExpandedMonth,
                  mode: DateDisplayMode.date,
                ),
                DatePickerButton(
                  onTap: () => setState(() => isExpandedDate = !isExpandedDate),
                  displayDateTime: time,
                  isExpanded: isExpandedDate,
                ),
              ],
            ),
            DatePickerContainer(
              onDateTimeChanged:
                  (newDatetime) => setState(() => time = newDatetime),
              initialDateTime: time,
              isExpanded: isExpandedMonth || isExpandedDate,
              minuteInterval: 1,
              mode:
                  isExpandedMonth
                      ? CupertinoDatePickerMode.date
                      : CupertinoDatePickerMode.time,
            ),
          ],
        ),
      ),
    );
  }
}
