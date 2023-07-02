import 'package:daasd12/constants.dart';
import 'package:daasd12/responsive.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';
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
                child: Column(
                  children: [
                    MyFiels(),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    RecentFiles(),

                    if (Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),

                    // Darshboard parte derecha
                    if (Responsive.isMobile(context)) StorageDetail()
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                SizedBox(
                  width: defaultPadding,
                ),

              // Darshboard parte derecha
              if (!Responsive.isMobile(context))
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
