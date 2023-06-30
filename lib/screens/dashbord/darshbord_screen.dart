import 'package:daasd12/constants.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/storagr_detail.dart';

class DashordScreen extends StatelessWidget {
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

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Darshboard parte izquierda
              Expanded(
                flex: 5,
                child: MyFiels(),
              ),

              SizedBox(
                width: defaultPadding,
              ),

              // Darshboard parte derecha
              Expanded(
                flex: 2,
                child: StorageDetail(),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

