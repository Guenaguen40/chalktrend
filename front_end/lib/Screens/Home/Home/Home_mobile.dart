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

class HomeMobile extends StatefulWidget {
  const HomeMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  void _openSidebar() {
    Scaffold.of(context).openDrawer();
  }

  void _handleSearch() {
    // Add logic for search functionality
  }

  @override
  Widget build(BuildContext context) {
    final loggedInUser = Provider.of<UserProvider>(context).loggedInUser;

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
                Text(
                  "Hello ${loggedInUser?.email ?? 'Guest'},",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (loggedInUser?.userType == 'Student')
                  
                if (loggedInUser?.userType == 'Tutor')
                CustomPromoCard(),
                  // Display tutor-specific content (e.g., balance, sessions)
                  // Adjust accordingly based on your design
                SizedBox(height: 24),
                // Horizontal views for different subjects
                // ... (rest of the code)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
