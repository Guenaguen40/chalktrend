import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class OnbordingBtn extends StatelessWidget {
  const OnbordingBtn({
    Key? key, 
    required RiveAnimationController btnAnimationController,
    required this.press,
    required this.buttonText, required this.iconVar, // Add a parameter for button text
  }) : 
    _btnAnimationController = btnAnimationController,
    super(key: key); 
  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;
  final String buttonText;
  final IconData  iconVar; // Add a variable to hold the button text

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconVar as IconData?, color: Colors.blue,),
                  SizedBox(
                    width: 8,
                  ),
                  Text(buttonText, // Use the buttonText parameter here
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
