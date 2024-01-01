import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'VerifyAccount_Mobile.dart';
import 'VerifyAccount_Desktop.dart';

class VerifyAccount extends StatelessWidget {
  static const String VerifyAccountRoute = StringConst.Verify_Account;
 

  const VerifyAccount({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: VerifyAccountMobile(),
          tablet: VerifyAccountDesktop(),
          desktop: VerifyAccountDesktop(),
        ),
      ),
    );
  }
}
