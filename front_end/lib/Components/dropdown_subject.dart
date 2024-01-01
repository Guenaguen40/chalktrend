import 'package:flutter/material.dart';

class DropdownSubjects extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String?)? validator;

  DropdownSubjects({
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  _DropdownSubjectsState createState() => _DropdownSubjectsState();
}

class _DropdownSubjectsState extends State<DropdownSubjects> {
  String? selectedSubject;

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
        value: selectedSubject,
        onChanged: (String? newValue) {
          setState(() {
            selectedSubject = newValue;
          });
        },
        items: [
          'Math',
          'Science',
          'Physics',
          'Chemistry',
          'Biology',
          'Algebra',
          'Geometry',
          'Trigonometry',
          'Calculus',
          'Statistics',
          'Computer Science',
          'Programming',
          'History',
          'Geography',
          'Social Studies',
          'Economics',
          'Political Science',
          'Psychology',
          'Sociology',
          'Philosophy',
          'Literature',
          'English',
          'French',
          'Spanish',
          'German',
          'Chinese',
          'Arabic',
          'Music',
          'Art',
          'Physical Education',
          'Health',
          'Technology',
          'Engineering',
          'Business',
          'Accounting',
          'Marketing',
          'Finance',
          'Medicine',
          'Nursing',
          'Dentistry',
          'Law',
          'Architecture',
          'Environmental Science',
          'Astronomy',
          'Psychiatry',
          'Nutrition',
          'Agriculture',
          'Languages',
          'Other',
          // Add more subjects as needed
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
