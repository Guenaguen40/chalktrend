import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/State/user_provider.dart';
import 'package:front_end/Core/State/user_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/VerifyAccount/VerifyAccount.dart';
import 'package:front_end/Screens/Auth/LoginScreen/LoginScreen.dart';
import 'package:http/http.dart' as http;

class SignUpScreenMobile extends StatefulWidget {
  SignUpScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpScreenMobileState createState() => _SignUpScreenMobileState();
}

class _SignUpScreenMobileState extends State<SignUpScreenMobile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> signUp() async {
    const String apiUrl = 'https://2237-160-159-205-189.ngrok-free.app/register';

    try {
      final loggedInUser = Provider.of<UserProvider>(context).loggedInUser;
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'usertype': loggedInUser?.userType,
        }),
      );
      if (response.statusCode == 201) {
        // Update user information in UserProvider
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setLoggedInUser(User(
            username: usernameController.text,
            email: emailController.text,
            userType: loggedInUser?.userType ?? ''));
        await sendVerificationCode(emailController.text);
        navigateToVerifyAccount();
      } else {
        // Registration failed, show an error message
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage =
            responseData['message'] ?? 'Registration failed';
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

  Future<void> sendVerificationCode(String email) async {
    const String apiUrl =
        'https://2237-160-159-205-189.ngrok-free.app/send-email';
    http.post(Uri.parse(apiUrl), body: {'email': email});

    print('Verification code sent to $email');
  }

  void navigateToVerifyAccount() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VerifyAccount(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    'Join our community today',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Create an account to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xCD303030),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: CustomTextField(
                    hintText: 'Username',
                    controller: usernameController,
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
                    hintText: 'Email Adress',
                    obscureText: true,
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: CustomTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
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
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: CustomButton(
                    text: "Create Account",
                    onPressed: signUp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    'By Creating Account, you agree to our Terms of Service and Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                       top: 25, bottom: 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
Padding(
padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
child: InkWell(
onTap: () async {
await Navigator.push(
context,
MaterialPageRoute(
builder: (context) => LoginScreen(),
),
);
},
child: Text(
'Login',
style: TextStyle(
color: Colors.blueGrey,
),
),
),
),
               ], ),
            ),],
                  ),
          ),),),);
          
  }
}
