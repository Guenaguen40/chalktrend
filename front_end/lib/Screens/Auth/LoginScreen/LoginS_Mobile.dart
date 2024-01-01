import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/State/user_provider.dart';
import 'package:front_end/Core/State/user_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/Role/Role.dart';
import 'package:front_end/Screens/Auth/ForgotPassword/ForgotPassword.dart';
import 'package:front_end/Screens/Home/Home/Home.dart';
import 'package:http/http.dart' as http;

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({Key? key}) : super(key: key);

  @override
  _LoginScreenMobileState createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> login() async {
    const String apiUrl = 'https://2237-160-159-205-189.ngrok-free.app/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': textController1.text,
          'password': textController2.text,
        }),
      );
      if (response.statusCode == 200) {
        // Update user information in UserProvider
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider
            .setLoggedInUser(User(email: textController1.text, userType: '', username: ""));

        // Navigate to the home screen
        navigateToHomeScreen();
      } else {
        // Registration failed, show an error message
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['message'] ?? 'Login failed';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
    } catch (error) {
      print(error);
      // Handle other errors as needed
    }
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

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
          child: SingleChildScrollView(
            child:
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Text(
              'Hello, you\'ve been missed here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                color: Color(0xCB303030),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              'Welcome back! Sign in to continue.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Color(0x9A696969),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top: 32),
            child: CustomTextField(
              controller: textController1,
              hintText: 'Email Address',
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomTextField(
              controller: textController2,
              hintText: 'Password',
              obscureText: !passwordVisibility,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 10, top: 16), // Add right padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align to the right
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: CustomButton(
              text: "Login",
              onPressed: //login
              navigateToHomeScreen,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, bottom: 32),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Role(),
                        ),
                      );
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),),);
  }

  void navigateToHomeScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }
}
