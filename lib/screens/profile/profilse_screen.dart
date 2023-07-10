
import 'package:daasd12/screens/profile/components/user_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../dashbord/components/header.dart';


class ProfileScreen extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          // Darshboard parte superior
          Header(),

          SizedBox(
            height: defaultPadding,

          ),
          UserProfileScreen(),

        ]),
      ),
    );
  }
}
