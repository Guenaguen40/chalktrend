import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:front_end/Core/Values/Strings.dart';
import 'Role_Mobile.dart';
import 'Role_Desktop.dart';

class Role extends StatelessWidget {
  static const String RoleRoute = StringConst.Role_S;

  const Role({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ScreenTypeLayout(
          mobile: RoleMobile(),
          tablet: RoleDesktop(),
          desktop: RoleDesktop(),
        ),
      ),
    );
  }
}
