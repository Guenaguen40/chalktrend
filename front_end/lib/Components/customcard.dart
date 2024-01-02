import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        color: Colors.white, // White background
      ),
      child: child,
    );
  }
}
