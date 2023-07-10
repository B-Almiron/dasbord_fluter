
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../dashbord/components/header.dart';
import 'components/chart_barra.dart';
import 'components/chart_barras.dart';


class TaskScreen extends StatelessWidget {
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

          BarChartSample4(),
          SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          LineChartSample2(),

          
        ]),
      ),
    );
  }
}
