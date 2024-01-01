import 'package:flutter/material.dart';
class TutorCard extends StatelessWidget {
  final String tutorName;
  final String subject;
  final String imageUrl; 

  const TutorCard({
    Key? key,
    required this.tutorName,
    required this.subject,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 160,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40, // Set a fixed radius value
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage(imageUrl), // Use AssetImage for local images
                ),
                IconButton(
                  onPressed: () {
                    // Add functionality for favorite or hire action
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              tutorName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subject,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                SizedBox(width: 4),
                Text(
                  '4.9', // Replace with the tutor's rating
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '\$25/hr', // Replace with the tutor's hourly rate
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
