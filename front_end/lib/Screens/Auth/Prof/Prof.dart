import 'package:flutter/material.dart';
import 'package:front_end/Screens/Auth/Prof/Prof_Mobile.dart';
import 'package:front_end/Screens/Auth/Prof/Prof_Mobile.dart';
import 'Prof_Desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';

class Prof extends StatelessWidget {
  static const String ProfRoute = StringConst.Prof;

  const Prof({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: ProfMobile(),
          tablet: ProfDesktop(),
          desktop: ProfDesktop(),
        ),
      ),
    );
  }
}
