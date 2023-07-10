
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';
import '../dashbord/components/header.dart';
import '../dashbord/components/storagr_detail.dart';
import 'components/table_notifi.dart';


class NotificaScreen extends StatelessWidget {
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
          NotificationsTable()

        ]),
      ),
    );
  }
}
