# Flutter Date Time Picker

A customizable date and time picker widget for Flutter applications with smooth animations and various display modes.

![Flutter Date Time Picker](https://example.com/path-to-your-image.png)

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  date_picker_button: ^0.0.1
```

## Usage

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:your_package_name/date_time_picker.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _selectedDateTime = DateTime.now();
  bool _isPickerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateTime Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateDisplayButton(
              onTap: () => setState(() => _isPickerVisible = !_isPickerVisible),
              displayDateTime: _selectedDateTime,
              isExpanded: _isPickerVisible,
              mode: TimeDisplayMode.dateAndTime,
            ),
            DatePickerContainer(
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() => _selectedDateTime = newDateTime);
              },
              initialDateTime: _selectedDateTime,
              isExpanded: _isPickerVisible,
            ),
          ],
        ),
      ),
    );
  }
}
```

### Available Display Modes

The package supports various display modes through the `DateDisplayMode` enum:

```dart
enum DateDisplayMode {
  date,          // Shows only date (YYYY/MM/DD)
  dateAndTime,   // Shows both date and time (YYYY/MM/DD HH:MM)
  monthYear,     // Shows only month and year (YYYY/MM)
  time,          // Shows only time (HH:MM)
}
```

### Customizing the Picker

Both the button and picker container are highly customizable:

```dart
TimeDisplayButton(
  onTap: () => setState(() => _isExpanded = !_isExpanded),
  initialDateTime: DateTime.now(),
  isExpanded: _isExpanded,
  // Customization options
  elevation: 4.0,
  borderRadius: 12.0,
  foregroundColor: Colors.blue,
  backgroundColor: Colors.white,
  height: 48.0,
  width: 180.0,
  mode: TimeDisplayButtonMode.date,
),

CupertinoDatePickerContainer(
  onDateTimeChanged: _handleDateChange,
  initialDateTime: DateTime.now(),
  isExpanded: _isExpanded,
  // Customization options
  height: 300.0,
  width: double.infinity,
  use24hFormat: true,
  minuteInterval: 5,
  mode: CupertinoDatePickerMode.dateAndTime,
),
```

## Example

See the `/sample` directory for a complete working example of how to use this package.

## Additional Information

### Dependencies

- Flutter SDK
- intl

## License

This package is licensed under the MIT License - see the LICENSE file for details.
