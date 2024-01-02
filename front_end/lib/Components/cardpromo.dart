import 'package:flutter/material.dart';
import 'package:front_end/Components/custom_button.dart';
import 'package:front_end/Components/customcard.dart';

class CustomPromoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tutoring Premium Package",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Sign up for our premium package and start hosting",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "your open sessions. Sell your tickets and",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "don't wait for session requests anymore!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "\$99.99/month",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  "\$49.99/month",
                  style: TextStyle(
                    color: Color(0xFFFA5322),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              text: "Sign Up Now",
              onPressed: () {
                // Add your action here
              },
            ),
          ),
        ],
      ),
    );
  }
}
