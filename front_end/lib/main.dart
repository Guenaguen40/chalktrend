import 'package:flutter/material.dart';
import 'package:front_end/Core/Route/route.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/State/user_provider.dart';
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => UserProvider(), 
      child: MaterialApp(
      navigatorKey: navigatorKey, 
      initialRoute: '/',
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => Navigator(
                key: navigatorKey,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/':
                      return MaterialPageRoute(
                        builder: (context) => const SplashS(),
                      );
                    case SignUpScreen.SignUpScreenRoute:
                      return MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      );
                    case LoginScreen.LoginScreenRoute:
                      return MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      );
                    case ForgotPassword.ForgotPasswordRoute:
                      return MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      );
                    case ResetPassword.ResetPasswordRoute:
                      return MaterialPageRoute(
                        builder: (context) => ResetPassword(),
                      );
                    case VerifyAccount.VerifyAccountRoute:
                      return MaterialPageRoute(
                        builder: (context) => VerifyAccount(),
                      );
                    case TutorInfo.TutorInfoRoute:
                      return MaterialPageRoute(
                        builder: (context) => TutorInfo(),
                      );
                    case Prof.ProfRoute:
                      return MaterialPageRoute(
                        builder: (context) => Prof(),
                      );
                    case TutorPaymentDetails.TutorPaymentDetailsRoute:
                      return MaterialPageRoute(
                        builder: (context) => TutorPaymentDetails(),
                      );
                    case Role.RoleRoute:
                      return MaterialPageRoute(
                        builder: (context) => Role(),
                      );
                    case WorkDetails.WorkDetailsRoute:
                      return MaterialPageRoute(
                        builder: (context) => WorkDetails(),
                      );
                    case Home.HomeRoute:
                      return MaterialPageRoute(
                        builder: (context) => Home(),
                      );
                    case TutorAvailability.TutorAvailabilityRoute:
                      return MaterialPageRoute(
                        builder: (context) => TutorAvailability(),
                      );
                    case StudentInfo.StudentInfoRoute:
                      return MaterialPageRoute(
                        builder: (context) => StudentInfo(),
                      );

                    default:
                      return MaterialPageRoute(
                        builder: (context) => NotFoundScreen(),
                      );
                  }
                },
              ),
            ),
          ],
        );
      },
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
