import 'package:flutter/material.dart';
import 'package:front_end/Screens/Auth/LoginScreen/LoginS_Mobile.dart';
import 'package:front_end/Screens/Auth/LoginScreen/LoginS_Desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';

class LoginScreen extends StatelessWidget {
  static const String LoginScreenRoute = StringConst.Login_Screen;

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: LoginScreenMobile(),
          tablet: LoginScreenDesktop(),
          desktop: LoginScreenDesktop(),
        ),
      ),
    );
  }
}
