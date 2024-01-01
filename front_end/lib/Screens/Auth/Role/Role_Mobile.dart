import 'package:flutter/material.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/SignUpScreen/SignUpS.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/State/user_provider.dart';
import 'package:front_end/Core/State/user_model.dart';

class RoleMobile extends StatelessWidget {
  String selectedRole = ""; // Variable to store the selected role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Role Selection',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Address Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomButton(
                          text: "I am a Student",
                          onPressed: () {
                            // Update the selected role
                            selectedRole = "Student";
                            // Navigate to the registration details screen
                            _navigateToSignUpScreen(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(width: 16), // Add some spacing between sections
                  // Zip Code Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomButton(
                          text: "I am a Teacher",
                          onPressed: () {
                            // Update the selected role
                            selectedRole = "Teacher";
                            // Navigate to the registration details screen
                            _navigateToSignUpScreen(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to navigate to the SignUpScreen with the selected role
  void _navigateToSignUpScreen(BuildContext context) {
  User user = User(
    username: "",
    email: "",
    userType: selectedRole,
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ),
  );
}

}
