import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.0, // Set the height to 60
      width: 445,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF78ADAD), // Set the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // Adjust the border radius as needed
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
