import 'package:flutter/material.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/TutorAvailability/TutorAvailability.dart';
import 'package:front_end/Components/ExperienceWidget.dart';
import 'package:front_end/Components/EducationWidget.dart';

class WorkDetailsMobile extends StatefulWidget {
  const WorkDetailsMobile({Key? key}) : super(key: key);

  @override
  State<WorkDetailsMobile> createState() => _WorkDetailsMobileState();
}

class _WorkDetailsMobileState extends State<WorkDetailsMobile> {
  List<ExperienceWidget> experienceWidgets = [];
  List<EducationWidget> educationWidgets = [];

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
                  'Experience (3 of 4 steps)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0x96303030),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              experienceWidgets.add(ExperienceWidget());
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (experienceWidgets.isNotEmpty) {
                                experienceWidgets.removeLast();
                              }
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(children: experienceWidgets),
                SizedBox(height: 16),
                Text(
                  'Education (4 of 4 steps)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0x96303030),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Education',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              educationWidgets.add(EducationWidget());
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (educationWidgets.isNotEmpty) {
                                educationWidgets.removeLast();
                              }
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(children: educationWidgets),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomButton(
                    text: 'Next',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TutorAvailability(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
