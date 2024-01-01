import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'ResetPassword_Mobile.dart';
import 'ResetPassword_Desktop.dart';

class ResetPassword extends StatelessWidget {
  static const String ResetPasswordRoute = StringConst.Reset_Password;

  const ResetPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: ResetPasswordMobile(),
          tablet: ResetPasswordDesktop(),
          desktop: ResetPasswordDesktop(),
        ),
      ),
    );
  }
}
