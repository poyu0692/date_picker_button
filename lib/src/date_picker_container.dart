import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerContainer extends StatefulWidget {
  final bool? isExpanded;
  final DateTime initialDateTime;
  final double? height;
  final double? width;
  final bool? use24hFormat;
  final bool? showDayofWeek;
  final int? minuteInterval;
  final void Function(DateTime) onDateTimeChanged;
  final CupertinoDatePickerMode? mode;

  const DatePickerContainer({
    super.key,
    required this.onDateTimeChanged,
    required this.initialDateTime,
    this.showDayofWeek,
    this.isExpanded,
    this.height,
    this.width,
    this.use24hFormat,
    this.minuteInterval,
    this.mode,
  });

  @override
  State<DatePickerContainer> createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  @override
  Widget build(BuildContext context) {
    final isExpanded = widget.isExpanded ?? false;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? widget.height ?? 250 : 0,
      width: widget.width,
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(top: isExpanded ? 20 : 0),
      decoration: BoxDecoration(color: Colors.transparent),
      transform: Matrix4.translationValues(0, isExpanded ? 0 : 20, 0),
      child: Opacity(
        opacity: isExpanded ? 1.0 : 0.0,
        child:
            isExpanded
                ? CupertinoDatePicker(
                  showDayOfWeek: widget.showDayofWeek ?? false,
                  initialDateTime: widget.initialDateTime,
                  mode: widget.mode ?? CupertinoDatePickerMode.time,
                  use24hFormat: widget.use24hFormat ?? true,
                  minuteInterval: widget.minuteInterval ?? 5,
                  onDateTimeChanged: widget.onDateTimeChanged,
                )
                : null,
      ),
    );
  }
}
