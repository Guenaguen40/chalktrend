import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;

  const Navbar({Key? key, this.onMenuPressed}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Set the background color to transparent
      elevation: 0, // Remove the elevation (shadow)
      title: Text(
        "ChalkTrend",
        style: TextStyle(color: Colors.black), // Set text color to black
      ),
      iconTheme: IconThemeData(color: Colors.black), // Set icon color to black
      leading: null, // This line ensures no leading widget is added.
    );
  }
}
