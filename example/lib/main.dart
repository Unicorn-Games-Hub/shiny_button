import 'package:flutter/material.dart';
import 'package:shiny_button/shiny_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shiny Button Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void launchURL(String url) {
    // Implement your URL launching logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shiny Button Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Subscribe and Play',
                icon: Icon(
                  FontAwesomeIcons.play,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.leftToRight,
                iconPosition: IconPosition.leading,
                isReverse: false,
                tooltip: 'This is a shiny button',
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                borderRadius: 16.0,
                elevation: 4.0,
                shadowColor: Colors.black54,
                customGradient: [Colors.red, Colors.yellow],
                showRipple: true,
              ),
              SizedBox(height: 20),
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Disabled Button',
                icon: Icon(
                  FontAwesomeIcons.play,
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
                disableElevationWhenDisabled: true,
              ),
              SizedBox(height: 20),
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'No Icon Button',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.leftToRight,
                isReverse: false,
              ),
              SizedBox(height: 20),
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Loading Button',
                backgroundColor: Colors.orange,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.leftToRight,
                isReverse: false,
                isLoading: true,
                loadingIndicatorSize: 24.0,
              ),
              SizedBox(height: 20),
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Custom Text Style',
                icon: Icon(
                  FontAwesomeIcons.star,
                  color: Colors.white,
                ),
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.rightToLeft,
                iconPosition: IconPosition.above,
                isReverse: false,
                textStyle: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'No Ripple Effect',
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.bottomToTop,
                isReverse: false,
                showRipple: false,
              ),
              SizedBox(height: 20),
              ShinyButton(
                onPressed: () => print('Long Pressed'),
                onLongPress: () => print('Button Long Pressed'),
                label: 'Long Press Button',
                backgroundColor: Colors.cyan,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.leftToRight,
                isReverse: false,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                padding: EdgeInsets.all(16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
