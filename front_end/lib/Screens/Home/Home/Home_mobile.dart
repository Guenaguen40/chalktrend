import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Components/cardpromo.dart';
import 'package:front_end/Components/drawer.dart';
import 'package:front_end/Components/TutorCard.dart';
import 'package:front_end/Core/State/user_provider.dart';
import 'package:front_end/Components/SessionRequest.dart';
import 'package:front_end/Components/balance.dart';
import 'package:front_end/Components/subjectcard.dart';
import 'package:front_end/Components/tutorcard01.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final List<NewSessionRequest> newSessionRequests = [
    NewSessionRequest(
      senderName: "John Doe",
      receiverName: "Baraa Smi",
      sessionType: "Custom",
      numberOfAttendants: 5,
      topic: "Mathematics",
      wayOfAttendance: "Online",
      numberOfSessions: 3,
      startingTime: "12/01/2024, 5:00pm",
    ),
  ];

  void _openSidebar() {
    Scaffold.of(context).openDrawer();
  }

  void _handleSearch() {
    // Add logic for search functionality
  }

  @override
  Widget build(BuildContext context) {
    // Simulate different user types for testing
    final bool isStudent = false; // Change to false for testing tutor view
    final bool isTutor = !isStudent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            _openSidebar();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _handleSearch();
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                if (isStudent)
                  // Hello Test User for Student
                  Text(
                    "Hello Test Student,", // For testing purposes
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (isTutor)
                  // Hello Test User for Tutor
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello Test Tutor,", // For testing purposes
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Tutor's Balance with circular background
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue, // Adjust the color as needed
                        ),
                        child: Text(
                          "\$1000", // Replace with actual balance
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 16),

                // Promo Card for Tutor
                if (isTutor) CustomPromoCard(),

                SizedBox(height: 16),

                // New Sessions for Tutor
                if (isTutor)
                  Text(
                    "New Session Requests:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Column(
                  children: newSessionRequests
                      .map((request) => NewSessionRequest(
                            senderName: request.senderName,
                            receiverName: request.receiverName,
                            sessionType: request.sessionType,
                            numberOfAttendants: request.numberOfAttendants,
                            topic: request.topic,
                            wayOfAttendance: request.wayOfAttendance,
                            numberOfSessions: request.numberOfSessions,
                            startingTime: request.startingTime,
                          ))
                      .toList(),
                ),

                SizedBox(height: 16),

                // Ongoing Sessions for Tutor
                if (isTutor)
                  CustomTutorSessionsCard(
                    title: "Ongoing Sessions",
                    sessions: [
                      "Ongoing Session 1",
                      "Ongoing Session 2",
                      // Add more ongoing sessions as needed
                    ],
                  ),

                SizedBox(height: 16),

                // Horizontal ScrollView for subjects
                if (isTutor)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Add your subject cards here
                        SubjectCard(title: "Math"),
                        SubjectCard(title: "English"),
                        SubjectCard(title: "Science"),
                        // Add more subjects as needed
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
