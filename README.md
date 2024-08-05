# Shiny Button Package 🌟

A customizable Flutter package to create beautiful, animated buttons with a shiny effect. Perfect for adding a touch of elegance and interactivity to your Flutter apps.

![shiny_button](https://github.com/user-attachments/assets/3e0db171-985a-4a52-bdd6-7e6bfb225c2a)

## Features 🎨

- Customizable shiny animation
- Optional icons with flexible positioning
- Custom gradients, text styles, and shapes
- Support for loading state and disabled state
- Tooltip support
- Ripple effect on press

## Getting Started 🚀

To use this package, add `shiny_button` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  shiny_button:
    path: ../
```

## Usage 📖

### Import the package

```dart
import 'package:shiny_button/shiny_button.dart';
```

### Basic Usage

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'Subscribe and Play',
  icon: Icon(
    Icons.play_arrow,
    color: Colors.white,
  ),
  backgroundColor: Colors.green,
  textColor: Colors.white,
);
```

### Advanced Usage

#### Shiny Button with Leading Icon

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'Subscribe and Play',
  icon: Icon(
    Icons.play_arrow,
    color: Colors.white,
  ),
  backgroundColor: Colors.green,
  textColor: Colors.white,
  shineDuration: Duration(seconds: 2),
  shineDirection: ShineDirection.leftToRight,
  iconPosition: IconPosition.leading,
  tooltip: 'This is a shiny button',
  textStyle: TextStyle(fontWeight: FontWeight.bold),
  borderRadius: 16.0,
  elevation: 4.0,
  shadowColor: Colors.black54,
  customGradient: [Colors.red, Colors.yellow],
  showRipple: true,
);
```

#### Disabled Shiny Button with Trailing Icon

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'Disabled Button',
  icon: Icon(
    Icons.play_arrow,
    color: Colors.white,
  ),
  backgroundColor: Colors.green,
  textColor: Colors.white,
  isEnabled: false,
  shineDuration: Duration(seconds: 3),
  shineDirection: ShineDirection.topToBottom,
  iconPosition: IconPosition.trailing,
  disabledBackgroundColor: Colors.grey,
  disabledTextColor: Colors.white,
  isReverse: true,
);
```

#### Shiny Button Without Icon

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'No Icon Button',
  backgroundColor: Colors.blue,
  textColor: Colors.white,
  shineDuration: Duration(seconds: 2),
  shineDirection: ShineDirection.leftToRight,
  isReverse: false,
);
```

#### Loading Shiny Button

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'Loading Button',
  backgroundColor: Colors.orange,
  textColor: Colors.white,
  shineDuration: Duration(seconds: 2),
  shineDirection: ShineDirection.leftToRight,
  isReverse: false,
  isLoading: true,
  loadingIndicatorSize: 24.0,
);
```

#### Shiny Button with Custom Text Style

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'Custom Text Style',
  icon: Icon(
    Icons.star,
    color: Colors.white,
  ),
  backgroundColor: Colors.purple,
  textColor: Colors.white,
  shineDuration: Duration(seconds: 2),
  shineDirection: ShineDirection.rightToLeft,
  iconPosition: IconPosition.above,
  isReverse: false,
  textStyle: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
);
```

#### Shiny Button Without Ripple Effect

```dart
ShinyButton(
  onPressed: () => print('Button Pressed!'),
  label: 'No Ripple Effect',
  backgroundColor: Colors.teal,
  textColor: Colors.white,
  shineDuration: Duration(seconds: 2),
  shineDirection: ShineDirection.bottomToTop,
  isReverse: false,
  showRipple: false,
);
```

## Example Project 📂

Check out the example project in the `example` directory to see all the features in action. You can run the example project using:

```sh
cd example
flutter run
```

## Contributions and Issues 🛠

Contributions are welcome! If you find any issues or have suggestions for new features, please open an issue or create a pull request.

## License 📄

This project is licensed under the MIT License. See the LICENSE file for more details.

```

MIT License

Copyright (c) 2024 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
