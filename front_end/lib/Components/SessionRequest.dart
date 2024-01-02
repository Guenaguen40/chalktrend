import 'package:flutter/material.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Components/customcard.dart';

class NewSessionRequest extends StatelessWidget {
  final String senderName;
  final String receiverName;
  final String sessionType;
  final int numberOfAttendants;
  final String topic;
  final String wayOfAttendance;
  final int numberOfSessions;
  final String startingTime;

  const NewSessionRequest({
    required this.senderName,
    required this.receiverName,
    required this.sessionType,
    required this.numberOfAttendants,
    required this.topic,
    required this.wayOfAttendance,
    required this.numberOfSessions,
    required this.startingTime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow("S", senderName, "R", receiverName),
          _buildTextField("Type", sessionType),
          _buildRow("Attendants", numberOfAttendants.toString(), "Sessions", numberOfSessions.toString()),
          Row(
            children: [
              Expanded(
                child: _buildTextField("", topic),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildTextField("", wayOfAttendance),
              ),
            ],
          ),
          _buildTextField("Time", startingTime),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: "Confirm",
                onPressed: () {
                  // Handle confirmation
                },
              ),
              CustomButton(
                text: "Cancel",
                onPressed: () {
                  // Handle cancellation
                },
              ),
              CustomButton(
                text: "Message",
                onPressed: () {
                  // Handle messaging
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (label.isNotEmpty)
            Text(
              "$label:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label1, String value1, String label2, String value2) {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(label1, value1),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _buildTextField(label2, value2),
        ),
      ],
    );
  }
}
