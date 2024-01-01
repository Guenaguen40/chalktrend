import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width < 768
        ? MediaQuery.of(context).size.width * 0.40 // For smaller screens, set a larger width
        : MediaQuery.of(context).size.width * 0.15; // For larger screens, set a smaller width

    return Container(
      width: drawerWidth,
      color: Colors.white,
      child: Drawer(
        elevation: 0.0, // Remove the shadow for the web version
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
            accountName: Text('Not Loged In'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/avaters/Avatar 1.jpg'),
            ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle navigation when the user taps on this item
                Navigator.of(context).pop(); // Close the drawer after selecting an item
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle navigation when the user taps on this item
                Navigator.of(context).pop(); // Close the drawer after selecting an item
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle navigation when the user taps on this item
                Navigator.of(context).pop(); // Close the drawer after selecting an item
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Login'),
              onTap: () {
                // Handle logout or any other action when the user taps on this item
                Navigator.of(context).pop(); // Close the drawer after selecting an item
              },
            ),
          ],
        ),
      ),
    );
  }
}
