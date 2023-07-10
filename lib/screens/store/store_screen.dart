import 'package:daasd12/screens/store/components/new_dat.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../dashbord/components/header.dart';
import '../dashbord/components/recent_files.dart';

class StoreScreen extends StatelessWidget {
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
          NewDato(),
          SizedBox(
            height: defaultPadding,
          ),
          RecentFiles(),

          
        ]),
      ),
    );
  }
}
