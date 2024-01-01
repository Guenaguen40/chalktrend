import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'StudentInfo_Mobile.dart';
import 'StudentInfo_Desktop.dart';

class StudentInfo extends StatelessWidget {
  static const String StudentInfoRoute = StringConst.Student_Info;

  const StudentInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: StudentInfoMobile(),
          tablet: StudentInfoDesktop(),
          desktop: StudentInfoDesktop(),
        ),
      ),
    );
  }
}
