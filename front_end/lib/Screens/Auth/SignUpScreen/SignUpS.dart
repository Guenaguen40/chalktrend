import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'SignUpS_Mobile.dart';
import 'SignUpS_Desktop.dart';

class SignUpScreen extends StatelessWidget {
  static const String SignUpScreenRoute = StringConst.Register_Screen;
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: SignUpScreenMobile(
          ),
          tablet: SignUpScreenDesktop(),
          desktop: SignUpScreenDesktop(),
        ),
      ),
    );
  }
}
