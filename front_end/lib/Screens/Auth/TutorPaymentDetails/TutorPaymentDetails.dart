import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'TutorPaymentDetails_Mobile.dart';
import 'TutorPaymentDetails_Desktop.dart';

class TutorPaymentDetails extends StatelessWidget {
  static const String TutorPaymentDetailsRoute = StringConst.Tutor_Info;

  const TutorPaymentDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: TutorPaymentDetailsMobile(),
          tablet: TutorPaymentDetailsDesktop(),
          desktop: TutorPaymentDetailsDesktop(),
        ),
      ),
    );
  }
}
