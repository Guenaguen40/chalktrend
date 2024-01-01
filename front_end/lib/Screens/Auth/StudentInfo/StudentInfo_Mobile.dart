import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:front_end/Components/dropdown_country.dart';
import 'package:front_end/Components/dropdown_education.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Auth/Prof/Prof.dart';
import 'package:front_end/Screens/Auth/TutorPaymentDetails/TutorPaymentDetails.dart';
class StudentInfoMobile extends StatefulWidget {
  const StudentInfoMobile({Key? key}) : super(key: key);

  @override
  _StudentInfoMobileState createState() => _StudentInfoMobileState();
}

class _StudentInfoMobileState extends State<StudentInfoMobile> {
  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController zipCodeController;
  late TextEditingController addressController;
  late TextEditingController academicLevelController;

  File? _image;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    aboutController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    zipCodeController = TextEditingController();
    addressController = TextEditingController();
    academicLevelController = TextEditingController();
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
                  'Student Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Personal (2 of 3 steps)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0x96303030),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Image',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _getImage,
                        child: Text('Pick Image'),
                      ),
                      _image != null
                          ? Image.file(
                              _image!,
                              height: 100,
                              width: 100,
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: nameController,
                  hintText: 'eg. John Doe',
                ),
                SizedBox(height: 16),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: aboutController,
                  hintText: 'eg. Enthusiastic learner looking for tutoring.',
                ),
                SizedBox(height: 16),
                Text(
                  'Country',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DropdownCountry(
                  controller: countryController,
                  hintText: 'Select Country',
                ),
                SizedBox(height: 16),
                Text(
                  'City',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: cityController,
                  hintText: 'eg. Cityville',
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Address Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Address',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            controller: addressController,
                            hintText: 'eg. Rue 28...',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(width: 16), // Add some spacing between sections
                    // Zip Code Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Zip Code',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            controller: zipCodeController,
                            hintText: 'eg. 4100',
                          ),
                        ],
                      ),
                    ),
                  ],
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
                SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: CustomButton(
                    text: 'Next',
                    onPressed: () {
                      // Add logic to save student information
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
