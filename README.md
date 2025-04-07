# Flutter Date Time Picker

A customizable date and time picker widget for Flutter applications with smooth animations and various display modes.

![Flutter Date Time Picker](https://example.com/path-to-your-image.png)

## Features

- 📅 Multiple display modes (date, time, date and time, month/year)
- 🔄 Smooth animations for picker expansion and collapse
- 🎨 Fully customizable appearance
- 📱 Uses native CupertinoDatePicker for a platform-consistent experience
- ⌚ 24-hour format support
- 🔍 Minute interval customization

## Platform Support

| Android | iOS | Web | macOS | Windows | Linux |
| ------- | --- | --- | ----- | ------- | ----- |
| ✅      | ✅  | ✅  | ✅    | ✅      | ✅    |

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.1 # For date formatting
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
            TimeDisplayButton(
              onTap: () => setState(() => _isPickerVisible = !_isPickerVisible),
              initialDateTime: _selectedDateTime,
              isExpanded: _isPickerVisible,
              mode: TimeDisplayButtonMode.dateAndTime,
            ),
            CupertinoDatePickerContainer(
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

The package supports various display modes through the `TimeDisplayButtonMode` enum:

```dart
enum TimeDisplayButtonMode {
  date,          // Shows only date (YYYY/MM/DD)
  dateAndTime,   // Shows both date and time (YYYY/MM/DD HH:MM)
  monthYear,     // Shows only month and year (YYYY年MM月)
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

## Components

### TimeDisplayButton

A button that displays the currently selected date and/or time based on the chosen mode.

#### Properties

| Property          | Type                     | Description                               |
| ----------------- | ------------------------ | ----------------------------------------- |
| `onTap`           | `Function()`             | Callback when the button is tapped        |
| `initialDateTime` | `DateTime`               | The date/time to display                  |
| `isExpanded`      | `bool`                   | Whether the associated picker is expanded |
| `elevation`       | `double?`                | Material elevation of the button          |
| `borderRadius`    | `double?`                | Border radius of the button               |
| `foregroundColor` | `Color?`                 | Color for text and icons                  |
| `backgroundColor` | `Color?`                 | Background color of the button            |
| `height`          | `double?`                | Height of the button                      |
| `width`           | `double?`                | Width of the button                       |
| `mode`            | `TimeDisplayButtonMode?` | Display mode for the date/time            |

### CupertinoDatePickerContainer

A container that wraps the CupertinoDatePicker with animations.

#### Properties

| Property            | Type                       | Description                                   |
| ------------------- | -------------------------- | --------------------------------------------- |
| `onDateTimeChanged` | `Function(DateTime)`       | Callback when date/time changes               |
| `initialDateTime`   | `DateTime`                 | Initial date/time value                       |
| `isExpanded`        | `bool?`                    | Whether the picker is visible                 |
| `height`            | `double?`                  | Height of the picker when expanded            |
| `width`             | `double?`                  | Width of the picker                           |
| `use24hFormat`      | `bool?`                    | Whether to use 24-hour format (default: true) |
| `minuteInterval`    | `int?`                     | Interval between minutes (default: 5)         |
| `mode`              | `CupertinoDatePickerMode?` | Picker mode (date, time, or both)             |

## Example

See the `/example` directory for a complete working example of how to use this package.

## Additional Information

### Dependencies

- Flutter SDK
- intl: For date/time formatting

## License

This package is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/amazing-feature`)
3. Commit your Changes (`git commit -m 'Add some amazing feature'`)
4. Push to the Branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
