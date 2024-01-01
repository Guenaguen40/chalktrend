import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'Home_mobile.dart';
import 'Home_desktop.dart';

class Home extends StatelessWidget {
  static const String HomeRoute = StringConst.Home;

  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: HomeMobile(),
          tablet: HomeDesktop(),
          desktop: HomeDesktop(),
        ),
      ),
    );
  }
}
