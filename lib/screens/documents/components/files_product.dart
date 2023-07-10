import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';

class RecentFilesProductos extends StatefulWidget {
  final String loggedInUserCorreo;

  const RecentFilesProductos({
    Key? key,
    required this.loggedInUserCorreo,
  }) : super(key: key);

  @override
  _RecentFilesProductosState createState() => _RecentFilesProductosState();
}

class _RecentFilesProductosState extends State<RecentFilesProductos> {
  
  List<dynamic> productos = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/usuarios'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final usuarios = data as List<dynamic>;
      final usuario = usuarios.firstWhere(
          (usuario) => usuario['correo'] == widget.loggedInUserCorreo,
          orElse: () => null);

      if (usuario != null) {
        setState(() {
          productos = usuario['productos'];
        });
      }
    } else {
      throw Exception('Failed to fetch usuarios');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent File",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("Nombre"),
                ),
                DataColumn(
                  label: Text("Precio"),
                ),
                DataColumn(
                  label: Text("Stock"),
                ),
                DataColumn(
                  label: Text("Distribuidora"),
                ),
              ],
              rows: List.generate(
                productos.length,
                (index) => recentFileDataRow(context, productos[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(BuildContext context, dynamic producto) {
  final String nombre = producto['nombre'];
  final double precio = producto['precio'];
  final int stock = producto['stock'];
  final String distribuidora = producto['distribuidora'];

  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/one_drive.svg',
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(nombre),
            ),
          ],
        ),
      ),
      DataCell(Text(precio.toString())),
      DataCell(Text(stock.toString())),
      DataCell(Text(distribuidora)),
    ],
  );
}
