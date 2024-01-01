import 'package:flutter/material.dart';
import 'package:front_end/Components/custom_text_field.dart';

class EducationWidget extends StatelessWidget {
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Degree',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: degreeController,
          hintText: 'eg. Bachelor of Science',
        ),
        SizedBox(height: 16),
        Text(
          'School Name',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: schoolController,
          hintText: 'eg. University of XYZ',
        ),
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Start Date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    controller: startDateController,
                    hintText: 'eg. 09/25',
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'End Date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    controller: endDateController,
                    hintText: 'eg. 123',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          'Description',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: descriptionController,
          hintText: 'eg. Studied computer science.',
        ),
      ],
    );
  }
}
