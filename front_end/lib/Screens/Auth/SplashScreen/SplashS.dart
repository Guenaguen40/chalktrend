import 'package:flutter/material.dart';
import 'package:front_end/Screens/Auth/SplashScreen/SplashS_desktop.dart';
import 'SplashS_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';

class SplashS extends StatelessWidget {
  static const String SplashSRoute = StringConst.Splash_S;

  const SplashS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: SplashsMobile(),
          tablet: SplashSDesktop(),
          desktop: SplashSDesktop(),
        ),
      ),
    );
  }
}
