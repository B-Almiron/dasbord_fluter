
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    List<PieChartSectionData> paicharSelectionData = [
      PieChartSectionData(color: primaryColor, radius: 25, value: 25),
      PieChartSectionData(color: Colors.amber, radius: 35, value: 25),
      PieChartSectionData(color: Colors.blueAccent, radius: 45, value: 45),
      PieChartSectionData(color: Colors.blueAccent, radius: 45, value: 45),
    ];
    return SizedBox(
      height: 200,
      child: Stack(children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 50,
            startDegreeOffset: -90,
            sections: paicharSelectionData,
          ),
        ),
        Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding,),
                Text(
                  "29.9",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 0.5),
                ),
                Text("of 126gb")
              ],
        ))
      ]),
    );
  }
}


