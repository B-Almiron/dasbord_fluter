
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';
import '../dashbord/components/header.dart';
import '../dashbord/components/storagr_detail.dart';


class DocumentScreen extends StatelessWidget {
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
