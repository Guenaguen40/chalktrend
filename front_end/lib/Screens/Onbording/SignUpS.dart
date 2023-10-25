import 'package:flutter/material.dart';
import 'package:front_end/Screens/Onbording/PaymentChoiceS.dart';
import 'package:front_end/Components/onbording_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:front_end/Components/InputText.dart';

class SignUpScreen2 extends StatefulWidget {
  final RiveAnimationController btnAnimationController;

  SignUpScreen2({required this.btnAnimationController});

  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  int currentStep = 0;
  List<StepPage> pages = [];
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController ageController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController addressController;
  late TextEditingController zipCodeController;
  late TextEditingController mobileNumberController;
  late TextEditingController confirmationCodeController;
  late TextEditingController paymentDetailsController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    ageController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();
    zipCodeController = TextEditingController();
    mobileNumberController = TextEditingController();
    confirmationCodeController = TextEditingController();
    paymentDetailsController = TextEditingController();

    pages = [
      StepPage(
        title: 'User Information',
        fields: [
          RoundedInputField(hintText: 'Email', controller: emailController),
          RoundedInputField(hintText: 'Password', controller: passwordController),
          RoundedInputField(hintText: 'Age', controller: ageController),
        ],
        nextStep: _nextStep,
        btnAnimationController: widget.btnAnimationController,
      ),
      StepPage(
        title: 'Residence',
        fields: [
          RoundedInputField(hintText: 'Country', controller: countryController),
          RoundedInputField(hintText: 'City', controller: cityController),
          RoundedInputField(hintText: 'Address', controller: addressController),
          RoundedInputField(hintText: 'Zip Code', controller: zipCodeController),
        ],
        nextStep: _nextStep,
        btnAnimationController: widget.btnAnimationController,
      ),
      StepPage(
        title: 'Mobile NumberConfirmation',
        fields: [
          RoundedInputField(hintText: 'Mobile Number', controller: mobileNumberController),
          RoundedInputField(hintText: 'Confirmation Code', controller: confirmationCodeController),
        ],
        nextStep: _nextStep,
        btnAnimationController: widget.btnAnimationController,
      ),
      StepPage(
        title: 'Payment Choice / Payment Details',
        fields: [
          RoundedInputField(hintText: 'Payment Details', controller: paymentDetailsController),
        ],
        nextStep: goToPaymentChoiceScreen,
        btnAnimationController: widget.btnAnimationController,
      ),
    ];
  }

  void _nextStep() {
    if (currentStep < pages.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void goToPaymentChoiceScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentChoiceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
  icon: Icon(
    currentStep == 0 ? Icons.exit_to_app : Icons.arrow_back,
    color: Colors.black, // Set the color to black
  ),
            onPressed: () {
              if (currentStep == 0) {
                // Handle exit action
                // You can show a dialog to confirm exit and navigate accordingly.
              } else {
                setState(() {
                  currentStep--;
                });
              }
            },
          ),
        ],
      ),
      body: pages[currentStep],
    );
  }
}

class StepPage extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  final VoidCallback nextStep;
  final RiveAnimationController btnAnimationController;

  StepPage({
    required this.title,
    required this.fields,
    required this.nextStep,
    required this.btnAnimationController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 24)),
        ...fields,
        SizedBox(height: 20),
        OnbordingBtn(
          press: nextStep,
          buttonText: 'Next',
          iconVar: CupertinoIcons.arrow_right,
          btnAnimationController: btnAnimationController,
        ),
      ],
    );
  }
}
