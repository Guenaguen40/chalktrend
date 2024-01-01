import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end/Screens/Auth/ResetPassword/ResetPassword.dart';
import 'package:rive/rive.dart';
import 'package:front_end/Components/animated_btn.dart';
import 'package:front_end/Components/responsive_nav_bar.dart';
import 'package:front_end/Components/drawer.dart';

class SplashSDesktop extends StatefulWidget {
  const SplashSDesktop({Key? key}) : super(key: key);

  @override
  State<SplashSDesktop> createState() => _SplashSDesktopState();
}

class _SplashSDesktopState extends State<SplashSDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  void navigateToSignUpScreen2() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ResetPassword(),
    ));
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Navbar(),
      endDrawer: isMobile(context) ? AppDrawer() : null,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            if (!isMobile(context))
              Container(
                child: AppDrawer(),
              ),
            Expanded(
              child: Stack(
                children: [
                  // Background Image
                  Positioned(
                    width: MediaQuery.of(context).size.width * 1.7,
                    bottom: 200,
                    left: 100,
                    child: Image.asset('assets/Backgrounds/Spline.png'),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                    ), // blur filter
                  ),
                  const RiveAnimation.asset(
                      'assets/RiveAssets/shapes.riv'), // the animated shapes background
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                      child: const SizedBox(),
                    ),
                  ),
                  // Animated Position for Button
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 240),
                    top: 0,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SafeArea(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile(context)
                                ? MediaQuery.of(context).size.width * 0.05
                                : 32.0, // Adjust the horizontal padding for mobile
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(
                                  flex:
                                      1), // Move elements up a bit for better visibility
                              Text(
                                isMobile(context)
                                    ? 'Find \nFreelancer \nTutors'
                                    : 'Find Freelancer Tutors',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      (isMobile(context) ? 0.19 : 0.1),
                                  fontFamily: "Poppins",
                                  height: 0,
                                ),
                              ),

                              SizedBox(
                                height: isMobile(context)
                                    ? 32.0
                                    : 16.0, // Adjust spacing for mobile
                              ),
                              Text(
                                "Discover and connect with freelance tutors for personalized learning. Learn from experts in various subjects and skills.",
                              ),
                              Spacer(flex: 3), // Add more space in the middle
                              // Animated Button
                              AnimatedBtn(
                                btnAnimationController: _btnAnimationController,
                                press: () {
                                  _btnAnimationController.isActive = true;
                                  navigateToSignUpScreen2();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 24.0),
                                child: Text(
                                  "Access a wide range of tutoring services, premium lessons, videos, source materials, and certification.",
                                  style: TextStyle(),
                                ),
                              ),
                              Spacer(flex: 2), // Add more space at the bottom
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
