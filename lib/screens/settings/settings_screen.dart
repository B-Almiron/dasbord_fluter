

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../dashbord/components/header.dart';
import 'components/setings_pages_screen.dart';


class SettingsScreen extends StatelessWidget {
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
          SettingsPage(),

        ]),
      ),
    );
  }
}
