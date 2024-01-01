import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end/Screens/Auth/Role/Role.dart';
import 'package:front_end/Screens/Auth/LoginScreen/LoginScreen.dart';
import 'package:rive/rive.dart';
import 'package:front_end/Components/animated_btn.dart';

class SplashsMobile extends StatefulWidget {
  const SplashsMobile({Key? key}) : super(key: key);

  @override
  State<SplashsMobile> createState() => _SplashsMobileState();
}

class _SplashsMobileState extends State<SplashsMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  void navigateToSignUpScreen2() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Role(),
    ));
  }

  void navigateToLoginScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 240),
            top: 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(children: [
                        Text(
                          "Find Freelancer Tutors",
                          style: TextStyle(
                              fontSize: 60, fontFamily: "Poppins", height: 1.2),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Discover and connect with freelance tutors for personalized learning. Learn from experts in various subjects and skills.")
                      ]),
                    ),
                    Spacer(
                             flex: 2,
                     ),
                    AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                press: () {
               _btnAnimationController.isActive = true;
                     navigateToSignUpScreen2();
                      },
                         ),
Row(
mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.start,
children: [
Padding(
padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 32),
child: Row(
mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('Already have an account?'),
Padding(
padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
child: InkWell(
onTap: () async {
await Navigator.push(
context,
MaterialPageRoute(
builder: (context) => LoginScreen(),
),
);
},
child: Text(
'Login',
style: TextStyle(
color: Colors.blueGrey,
),
),
),
),
],
),
),
],
),
Padding(
padding: const EdgeInsets.symmetric(vertical: 24.0),
child: Text(
"Access a wide range of tutoring services, premium lessons, videos, source materials, and certification.",
style: TextStyle(),
),
),
],
),
),
),
),
],
),
);
}
}