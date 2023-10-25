import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:front_end/Screens/Onbording/SplashS.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}



//------------------------------------------------




class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thank You!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Thank you for signing up!'),
            ElevatedButton(
              onPressed: () {
                // Add navigation logic to the user's account
              },
              child: Text('Get to Account'),
            ),
          ],
        ),
      ),
    );
  }
}
