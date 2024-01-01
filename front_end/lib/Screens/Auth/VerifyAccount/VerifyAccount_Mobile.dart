import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/State/user_provider.dart'; 
import 'package:front_end/Core/State/user_model.dart'; 
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/TutorInfo/TutorInfo.dart';
import 'package:front_end/Screens/Auth/StudentInfo/StudentInfo.dart';
import 'package:front_end/Screens/Auth/WorkDetails/WorkDetails.dart';

class VerifyAccountMobile extends StatefulWidget {


  VerifyAccountMobile({Key? key, }) : super(key: key);

  @override
  State<VerifyAccountMobile> createState() => _VerifyAccountMobileState();
}

class _VerifyAccountMobileState extends State<VerifyAccountMobile> {
  late TextEditingController verificationCodeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    verificationCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
     final loggedInUser = Provider.of<UserProvider>(context).loggedInUser;
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                'Verify Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'Enter the verification code sent to your email address to verify your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xCB303030),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Padding(
                padding: const EdgeInsets.only(),
                child: CustomTextField(
                  controller: verificationCodeController,
                  hintText: 'Verification Code',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: CustomButton(
            text: 'Verify',
            onPressed: () {
              // Add logic for verifying the account
              if (loggedInUser != null) {
                if (loggedInUser.userType == "Student") {
                  // Navigate to StudentDetails
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StudentInfo(),
                  ));
                } else if (loggedInUser.userType == "Teacher") {
                  // Navigate to WorkDetails
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WorkDetails(),
                  ));
                }
              }
            },
          ),
        ))]
      )));
        
  }
}
