import 'dart:io';
import 'package:flutter/material.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/WorkDetails/WorkDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:front_end/Screens/Auth/TutorPaymentDetails/TutorPaymentDetails.dart';
import 'package:front_end/Components/dropdown_subject.dart';
import 'package:front_end/Components/dropdown_education.dart';

class TutorAvailabilityMobile extends StatefulWidget {
  const TutorAvailabilityMobile({Key? key}) : super(key: key);

  @override
  _TutorAvailabilityMobileState createState() =>
      _TutorAvailabilityMobileState();
}

class _TutorAvailabilityMobileState extends State<TutorAvailabilityMobile> {
  late TextEditingController availabilityController;
  late TextEditingController payPerHourController;
  late TextEditingController academicLevelController;
  late TextEditingController subjectController;

  @override
  void initState() {
    super.initState();
    availabilityController = TextEditingController();
    payPerHourController = TextEditingController();
    academicLevelController = TextEditingController();
    subjectController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  'Tutor Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Availability & Details (2 of 4 steps)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0x96303030),
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Availability per Week',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: availabilityController,
                  hintText: 'eg. 10 hours',
                ),
                SizedBox(height: 16),
                Text(
                  'Pay per Hour',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: payPerHourController,
                  hintText: 'eg. \$30',
                ),
                SizedBox(height: 16),
                Text(
                  'Academic Level',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DropdownEducationLevel(
                  controller: academicLevelController,
                  hintText: 'eg. High School',
                ),
                SizedBox(height: 16),
                Text(
                  'Subject',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DropdownSubjects(
                  controller: subjectController,
                  hintText: 'eg. Math',
                ),
                SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: CustomButton(
                    text: 'Next',
                    onPressed: () {
                      // Add logic to save tutor availability information
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TutorPaymentDetails(),
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
