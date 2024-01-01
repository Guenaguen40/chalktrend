import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';

class ResetPasswordMobile extends StatefulWidget {
  const ResetPasswordMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetPasswordMobile> createState() => _ResetPasswordMobileState();
}

class _ResetPasswordMobileState extends State<ResetPasswordMobile> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
                'Reset Password',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: CustomTextField(
                  controller: newPasswordController,
                  hintText: 'New Password',
                  obscureText: true,
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
                child: CustomTextField(
                  controller: confirmController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    } else if (value != newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: CustomButton(
                  text: 'Reset Password',
                  onPressed: () {
                    // Add logic for resetting the password
                    print('Reset Password Button pressed ...');
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
