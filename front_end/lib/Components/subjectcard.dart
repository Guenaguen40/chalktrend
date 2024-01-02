import 'package:flutter/material.dart';

// Custom Subject Card
class SubjectCard extends StatelessWidget {
  final String title;

  const SubjectCard({required this.title});

  @override
  Widget build(BuildContext context) {
    // Customize the design of the subject card
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
