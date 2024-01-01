import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_end/Core/State/user_provider.dart';
import 'package:front_end/Core/State/user_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'package:front_end/Components/custom_text_field.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Screens/Home/Home/Home.dart';

class TutorPaymentDetailsMobile extends StatefulWidget {
  const TutorPaymentDetailsMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<TutorPaymentDetailsMobile> createState() =>
      _TutorPaymentDetailsMobileState();
}

class _TutorPaymentDetailsMobileState extends State<TutorPaymentDetailsMobile> {
  late TextEditingController CardholderNameController;
  late TextEditingController cardnumberController;
  late TextEditingController ExpirationDateController;
  late TextEditingController cvvController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    CardholderNameController = TextEditingController();
    cardnumberController = TextEditingController();
    ExpirationDateController = TextEditingController();
    cvvController = TextEditingController();
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tutor Information',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Payment Details (3 of 4 steps)',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0x96303030),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Card Owner',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: CardholderNameController,
                      hintText: 'eg. John Doe',
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Card Number',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: cardnumberController,
                      hintText: 'eg. 4755 6699..',
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
                                'Expiration Dat',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: ExpirationDateController,
                                hintText: 'eg. 09/25',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                            width: 16), // Add some spacing between sections
                        // Zip Code Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Cvv',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: cvvController,
                                hintText: 'eg. 123',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
