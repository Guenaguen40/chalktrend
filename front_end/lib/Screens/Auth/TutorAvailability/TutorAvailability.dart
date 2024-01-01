import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'TutorAvailability_mobile.dart';
import 'TutorAvailability_desktop.dart';

class TutorAvailability extends StatelessWidget {
  static const String TutorAvailabilityRoute = StringConst.Tutor_Availability;

  const TutorAvailability({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: TutorAvailabilityMobile(),
          tablet: TutorAvailabilityDesktop(),
          desktop: TutorAvailabilityDesktop(),
        ),
      ),
    );
  }
}
