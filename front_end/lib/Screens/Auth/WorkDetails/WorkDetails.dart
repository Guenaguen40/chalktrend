import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'WorkDetails_mobile.dart';
import 'WorkDetails_desktop.dart';

class WorkDetails extends StatelessWidget {
  static const String WorkDetailsRoute = StringConst.Work_Details;

  const WorkDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: WorkDetailsMobile(),
          tablet: WorkDetailsDesktop(),
          desktop: WorkDetailsDesktop(),
        ),
      ),
    );
  }
}
