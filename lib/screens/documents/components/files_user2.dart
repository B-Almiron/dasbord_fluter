import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';
class RecentFilespruebass2 extends StatefulWidget {
  const RecentFilespruebass2({
    Key? key,
  }) : super(key: key);

  @override
  _RecentFilespruebaState createState() => _RecentFilespruebaState();
}

class _RecentFilespruebaState extends State<RecentFilespruebass2> {
  List<dynamic> usuarios = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/usuarios'));

    if (response.statusCode == 200) {
      setState(() {
        usuarios = json.decode(response.body);
      });
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
                  label: Text("Usuarios"),
                ),
                DataColumn(
                  label: Text("productos"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Options"),
                ),
              ],
              rows: List.generate(
                usuarios.length,
                (index) => recentFileDataRow(context, usuarios[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(BuildContext context, dynamic usuario) {
  final String fileName = usuario['nombre'];
  final String date = usuario['productos'].length.toString();
  final String capital_inicial = usuario['finanzas']['capital_inicial'].toString();
  final String balance = usuario['finanzas']['balance'].toString();

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
              child: Text(fileName),
            ),
          ],
        ),
      ),
      DataCell(Text(date)),
      DataCell(Text(capital_inicial)),
      DataCell(Text(balance)),
      
    ],
  );
}

