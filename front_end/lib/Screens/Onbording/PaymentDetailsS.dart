import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front_end/Screens/Onbording/PaymentDetailsS.dart';
class PaymentDetailsScreen extends StatefulWidget {
  @override
  _PaymentDetailsScreenState createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  void ShowAThankYouMessage() {
    // Implement payment details and thank you logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Details')),
      body: Column(
        children: <Widget>[
          // Add payment details form
          ElevatedButton(
            onPressed: ShowAThankYouMessage,
            child: Text('Complete Sign Up'),
          ),
        ],
      ),
    );
  }
}
