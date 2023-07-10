import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';

class Chart22222 extends StatefulWidget {
  const Chart22222({
    Key? key,
  }) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart22222> {
  List<dynamic> productos = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/usuarios'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final usuarios = data as List<dynamic>;
      final usuario = usuarios.firstWhere((usuario) => usuario['correo'] == "123",
          orElse: () => null);

      if (usuario != null) {
        setState(() {
          productos = usuario['productos'];
          productos.sort((a, b) => b['stock'].compareTo(a['stock'])); // Ordenar por stock de mayor a menor
          productos = productos.take(5).toList(); // Obtener los primeros 5 productos con mayor stock
        });
      }
    } else {
      throw Exception('Failed to fetch usuarios');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<PieChartSectionData> pieChartSelectionData = List.generate(
      productos.length,
      (index) {
        final int stock = productos[index]['stock'];

        return PieChartSectionData(
          color: primaryColor,
          radius: stock.toDouble() / 2,
          value: stock.toDouble(),
          title: stock.toString(),
          titleStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      },
    );

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 50,
              startDegreeOffset: -90,
              sections: pieChartSelectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "Stock",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}