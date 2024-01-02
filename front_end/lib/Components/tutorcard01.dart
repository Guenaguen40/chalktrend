import 'package:flutter/material.dart';

// Custom Sessions Card for Tutor
class CustomTutorSessionsCard extends StatelessWidget {
  final String title;
  final List<String> sessions;

  const CustomTutorSessionsCard({required this.title, required this.sessions});

  @override
  Widget build(BuildContext context) {
    // Customize the design of the tutor's sessions card
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Display the list of sessions
        for (var session in sessions)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(session),
          ),
      ],
    );
  }
}
