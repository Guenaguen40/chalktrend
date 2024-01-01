import 'package:flutter/material.dart';

class DropdownEducationLevel extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String?)? validator;

  DropdownEducationLevel({
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  _DropdownEducationLevelState createState() => _DropdownEducationLevelState();
}

class _DropdownEducationLevelState extends State<DropdownEducationLevel> {
  String? selectedEducationLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0x65757575),
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedEducationLevel,
        onChanged: (String? newValue) {
          setState(() {
            selectedEducationLevel = newValue;
          });
        },
        items: [
          'PRIMARY SCHOOL',
          'Middle school',
          'High school',
          'License Degree',
          'MASTER DEGREE',
          'PHD',
          // Add more levels as needed
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'poppin',
            color: Color(0x98303030),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
       validator: (String? val) {
    if (val == null || val.isEmpty) {
      return 'Required';
    }
    return null;
  },
      ),
    );
  }
}
