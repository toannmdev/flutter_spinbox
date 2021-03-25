# SpinBox for Flutter

SpinBox for [Flutter](https://flutter.dev) is a numeric input widget with an input field for
entering a specific value, and spin buttons for quick, convenient, and accurate value adjustments.

Package forked by [Flutter Spinbox](https://github.com/jpnurmi/flutter_spinbox) of Jpnurmi

## Guidelines

Spin boxes are best suited for such applications
- that deal with large numeric value ranges and high precisions,
- where users typically know upfront the exact value they are entering,
- where users may later have a need to accurately adjust a previously entered value.

As a rule of thumb, spin boxes are great for scenarios where
- sliders and alike UI controls are too inaccurate,
- tumblers and alike UI controls cannot provide enough value range,
- and a plain text field is inconvenient for value adjustments
 (open the VKB, move the cursor, erase the previous value, enter a new value... vs. tap-tap-done).

## Designs

SpinBox for Flutter comes in two variants. It provides implementations for both designs in Flutter,
Material and Cupertino (iOS).

### Material Design

![SpinBox](https://github.com/NamSukio/flutter_spinbox/blob/master/doc/images/spinbox.gif "SpinBox")

```dart
import 'package:flutter_spinbox_fork/material.dart'; // or flutter_spinbox_fork.dart for both

SpinBox(
  min: 1,
  max: 100,
  value: 50,
  onChanged: (value) => print(value),
)
```

See also [Material Components widgets](https://flutter.dev/docs/development/ui/widgets/material) package.

### Cupertino (iOS-style) Design

![CupertinoSpinBox](https://github.com/NamSukio/flutter_spinbox/blob/master/doc/images/cupertino_spinbox.gif "CupertinoSpinBox")

```dart
import 'package:flutter_spinbox_fork/cupertino.dart'; // or flutter_spinbox_fork.dart for both

CupertinoSpinBox(
  min: 1,
  max: 100,
  value: 50,
  onChanged: (value) => print(value),
)
```

See also [Cupertino (iOS-style) widgets](https://flutter.dev/docs/development/ui/widgets/cupertino) package.

## Usage

To use this package, add `flutter_spinbox` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
