import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'TutorInfo_Mobile.dart';
import 'TutorInfo_Desktop.dart';

class TutorInfo extends StatelessWidget {
  static const String TutorInfoRoute = StringConst.Tutor_Info;

  const TutorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: TutorInfoMobile(),
          tablet: TutorInfoDesktop(),
          desktop: TutorInfoDesktop(),
        ),
      ),
    );
  }
}
