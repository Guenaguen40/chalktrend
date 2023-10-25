import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front_end/Screens/Onbording/PaymentDetailsS.dart';
class PaymentChoiceScreen extends StatefulWidget {
  @override
  _PaymentChoiceScreenState createState() => _PaymentChoiceScreenState();
}

class _PaymentChoiceScreenState extends State<PaymentChoiceScreen> {
  void goToPaymentDetailsScreen() {
    // Implement payment choice logic and navigate to the payment details screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Choice')),
      body: Column(
        children: <Widget>[
          // Add payment choice options and logic
          ElevatedButton(
            onPressed: goToPaymentDetailsScreen,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
