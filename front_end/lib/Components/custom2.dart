import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String?)? validator;
  final ValueChanged<String>? onChanged; 
  CustomTextField({
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
          border: InputBorder.none, // Remove the default border
          focusedBorder: InputBorder.none, // Remove the focused border
          errorBorder: InputBorder.none, // Remove the error border
          enabledBorder: InputBorder.none, // Remove the enabled border
          disabledBorder: InputBorder.none, // Remove the disabled border
        ),
validator: (String? val) {
    if (val == null || val.isEmpty) {
      return 'Required';
    }
    return null;
  },      ),
    );
  }
}
