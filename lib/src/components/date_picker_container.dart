import 'package:flutter/cupertino.dart';

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
  State<DatePickerContainer> createState() =>
      _CupertinoDatePickerContainerState();
}

class _CupertinoDatePickerContainerState extends State<DatePickerContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  @override
  void didUpdateWidget(DatePickerContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded ?? false) {
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

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: widget.isExpanded ?? false ? widget.height ?? 250 : 0,
      width: widget.width,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child:
                widget.isExpanded ?? false
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
        ),
      ),
    );
  }
}
