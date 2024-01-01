import 'package:flutter/material.dart';
import 'package:front_end/Screens/Auth/SplashScreen/SplashS.dart';
import 'package:front_end/Screens/Auth/SignUpScreen/SignUpS.dart';
import 'package:front_end/Screens/Auth/LoginScreen/LoginScreen.dart';
import 'package:front_end/Screens/Auth/ForgotPassword/ForgotPassword.dart';
import 'package:front_end/Screens/Auth/ResetPassword/ResetPassword.dart';
import 'package:front_end/Screens/Auth/VerifyAccount/VerifyAccount.dart';
import 'package:front_end/Screens/Auth/TutorInfo/TutorInfo.dart';
import 'package:front_end/Screens/Auth/Prof/Prof.dart';
import 'package:front_end/Screens/Auth/TutorPaymentDetails/TutorPaymentDetails.dart';
import 'package:front_end/Screens/Auth/WorkDetails/WorkDetails.dart';
import 'package:front_end/Screens/Home/Home/Home.dart';
import 'package:front_end/Screens/Auth/TutorAvailability/TutorAvailability.dart';
import 'package:front_end/Screens/Auth/Role/Role.dart';
import 'package:front_end/Screens/Auth/StudentInfo/StudentInfo.dart';

typedef PathWidgetBuilder = Widget Function(
    BuildContext, String? /*Map<String, String>*/);

class Path {
  const Path(this.pattern, this.builder);
  final String pattern;

  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + SplashS.SplashSRoute,
      (context, matches) => const SplashS(),
    ),
    Path(
      r'^' + SignUpScreen.SignUpScreenRoute,
      (context, matches) => SignUpScreen(),
    ),
    Path(
      r'^' + LoginScreen.LoginScreenRoute,
      (context, matches) => LoginScreen(),
    ),
    Path(
      r'^' + ForgotPassword.ForgotPasswordRoute,
      (context, matches) => ForgotPassword(),
    ),
    Path(
      r'^' + ResetPassword.ResetPasswordRoute,
      (context, matches) => ResetPassword(),
    ),
    Path(
      r'^' + VerifyAccount.VerifyAccountRoute,
      (context, matches) => VerifyAccount(),
    ),
    Path(
      r'^' + TutorInfo.TutorInfoRoute,
      (context, matches) => TutorInfo(),
    ),
    Path(
      r'^' + Prof.ProfRoute,
      (context, matches) => Prof(),
    ),
    Path(
      r'^' + TutorPaymentDetails.TutorPaymentDetailsRoute,
      (context, matches) => TutorPaymentDetails(),
    ),
    Path(
      r'^' + Role.RoleRoute,
      (context, matches) => Role(),
    ),
    Path(
      r'^' + WorkDetails.WorkDetailsRoute,
      (context, matches) => WorkDetails(),
    ),
    Path(
      r'^' + Home.HomeRoute,
      (context, matches) => Home(),
    ),
    Path(
      r'^' + TutorAvailability.TutorAvailabilityRoute,
      (context, matches) => TutorAvailability(),
    ),
    Path(
      r'^' + StudentInfo.StudentInfoRoute,
      (context, matches) => StudentInfo(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
