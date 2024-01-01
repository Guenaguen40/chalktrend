import 'package:flutter/material.dart';
import 'package:front_end/Screens/Auth/ForgotPassword/ForgotPassword_Mobile.dart';
import 'package:front_end/Screens/Auth/ForgotPassword/ForgotPassword_Desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';

class ForgotPassword extends StatelessWidget {
  static const String ForgotPasswordRoute = StringConst.Forgot_Password;

  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: ForgotPasswordMobile(),
          tablet: ForgotPasswordDesktop(),
          desktop: ForgotPasswordDesktop(),
        ),
      ),
    );
  }
}
