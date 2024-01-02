import 'package:flutter/material.dart';
import 'package:front_end/Components/customcard.dart';

// Custom Balance Card for Tutor
class CustomTutorBalanceCard extends StatelessWidget {
  final double balance;

  const CustomTutorBalanceCard({required this.balance});

  @override
  Widget build(BuildContext context) {
    // Customize the design of the tutor's balance card
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Balance: \$$balance",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
