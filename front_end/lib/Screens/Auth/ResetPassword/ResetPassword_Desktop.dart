import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';

class ResetPasswordDesktop extends StatefulWidget {
  const ResetPasswordDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetPasswordDesktop> createState() => _ResetPasswordDesktopState();
}

class _ResetPasswordDesktopState extends State<ResetPasswordDesktop> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
                'Reset Password'),
    );
  }
}
