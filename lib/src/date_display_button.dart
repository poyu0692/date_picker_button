import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DateDisplayMode { date, dateAndTime, monthYear, time }

class DateDisplayButton extends StatefulWidget {
  final void Function() onTap;
  final DateTime displayDateTime;
  final bool isExpanded;
  final bool isArrowEnable;
  final bool isIconEnable;
  final IconData? icon;
  final double? elevation;
  final double? borderRadius;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final DateDisplayMode? mode;

  const DateDisplayButton({
    super.key,
    required this.onTap,
    required this.displayDateTime,
    required this.isExpanded,
    this.isArrowEnable = true,
    this.isIconEnable = true,
    this.icon,
    this.elevation,
    this.borderRadius,
    this.foregroundColor,
    this.backgroundColor,
    this.height,
    this.width,
    this.mode,
  });

  @override
  State<DateDisplayButton> createState() => _DateDisplayButtonState();
}

class _DateDisplayButtonState extends State<DateDisplayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: -0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(DateDisplayButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _formatDateTime() {
    final mode = widget.mode ?? DateDisplayMode.time;

    switch (mode) {
      case DateDisplayMode.date:
        return DateFormat('yyyy/MM/dd').format(widget.displayDateTime);
      case DateDisplayMode.dateAndTime:
        return DateFormat('yyyy/MM/dd HH:mm').format(widget.displayDateTime);
      case DateDisplayMode.monthYear:
        return DateFormat('yyyy/MM').format(widget.displayDateTime);
      case DateDisplayMode.time:
        return DateFormat('HH:mm').format(widget.displayDateTime);
    }
  }

  IconData _getIcon() {
    final mode = widget.mode ?? DateDisplayMode.time;

    if (widget.icon != null) {
      return widget.icon!;
    }

    switch (mode) {
      case DateDisplayMode.date:
        return Icons.calendar_today;
      case DateDisplayMode.dateAndTime:
        return Icons.event;
      case DateDisplayMode.monthYear:
        return Icons.calendar_month;
      case DateDisplayMode.time:
        return Icons.access_time_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: widget.elevation ?? 0.0,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          color: widget.backgroundColor,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            child: Container(
              height: widget.height,
              width: widget.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.isIconEnable
                      ? Icon(
                        _getIcon(),
                        size: 22.0,
                        color: widget.foregroundColor,
                      )
                      : SizedBox(),
                  SizedBox(width: widget.isIconEnable ? 8.0 : 0.0),
                  Text(
                    _formatDateTime(),
                    style: TextStyle(
                      fontSize: 17.0,
                      color: widget.foregroundColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: widget.isArrowEnable ? 8.0 : 0.0),
                  widget.isArrowEnable
                      ? AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationAnimation.value * pi,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18.0,
                              color: widget.foregroundColor,
                            ),
                          );
                        },
                      )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
