import 'package:flutter/material.dart';
import 'package:front_end/Screens/Auth/TutorAvailability/TutorAvailability.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:front_end/Screens/Auth/TutorAvailability/TutorAvailability.dart';

class ProfMobile extends StatefulWidget {
  const ProfMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfMobile> createState() => _ProfMobileState();
}

class _ProfMobileState extends State<ProfMobile> {
  late TextEditingController documentNameController;
  List<PlatformFile>? selectedFiles = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    documentNameController = TextEditingController();
  }

  Future<void> _pickFiles() async {
    FilePickerResult? files =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (files != null) {
      setState(() {
        selectedFiles = files as List<PlatformFile>?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            // Navigate back or handle as needed
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Submit Application',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Text(
                'Add files and provide names for each document to submit your application.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xCB303030),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: TextFormField(
                  controller: documentNameController,
                  decoration: InputDecoration(
                    labelText: 'Document Name',
                    hintText: 'Enter a name for the document',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: ElevatedButton(
                  onPressed: _pickFiles,
                  child: Text('Add Files'),
                ),
              ),
            ),
            // Display selected files
            if (selectedFiles != null && selectedFiles!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Files:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (var file in selectedFiles!)
                      Text(
                        '- ${file.name}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: CustomButton(
                  text: 'Submit Application',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TutorAvailability(),
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
