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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ShinyButton with leading icon and left to right shine
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
              ),
              SizedBox(height: 20),

              // ShinyButton with trailing icon and right to left shine
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Play and Subscribe',
                icon: Icon(
                  FontAwesomeIcons.play,
                  color: Colors.white,
                ),
                backgroundColor: Colors.orange,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.rightToLeft,
                iconPosition: IconPosition.trailing,
                isReverse: false,
              ),
              SizedBox(height: 20),

              // ShinyButton with leading icon and top to bottom shine
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Join Us',
                icon: Icon(
                  FontAwesomeIcons.userPlus,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 3),
                shineDirection: ShineDirection.topToBottom,
                iconPosition: IconPosition.leading,
                isReverse: false,
              ),
              SizedBox(height: 20),

              // ShinyButton with trailing icon and bottom to top shine
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Join and Play',
                icon: Icon(
                  FontAwesomeIcons.userPlus,
                  color: Colors.white,
                ),
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 3),
                shineDirection: ShineDirection.bottomToTop,
                iconPosition: IconPosition.trailing,
                isReverse: false,
              ),
              SizedBox(height: 20),

              // Disabled ShinyButton
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
              ),
              SizedBox(height: 20),

              // ShinyButton with no icon
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

              // ShinyButton with reverse shine direction
              ShinyButton(
                onPressed: () => launchURL('https://example.com'),
                label: 'Reverse Shine',
                icon: Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                isEnabled: true,
                shineDuration: Duration(seconds: 2),
                shineDirection: ShineDirection.leftToRight,
                iconPosition: IconPosition.leading,
                isReverse: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
