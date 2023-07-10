import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';
import '../../notificat/components/table_notifi.dart';

class RecentFilesProductosStore extends StatefulWidget {
  final String loggedInUserCorreo;

  const RecentFilesProductosStore({
    Key? key,
    required this.loggedInUserCorreo,
  }) : super(key: key);

  @override
  _RecentFilesProductosStoreState createState() =>
      _RecentFilesProductosStoreState();
}

class _RecentFilesProductosStoreState
    extends State<RecentFilesProductosStore> {
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
                DataColumn(
                  label: Text("Opciones"),
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
      DataCell(
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(context, producto);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Agrega aquí la lógica para eliminar el producto
              },
            ),
          ],
        ),
      ),
    ],
  );
}

void _showEditDialog(BuildContext context, dynamic producto) {
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController distribuidoraController = TextEditingController();

  nombreController.text = producto['nombre'];
  precioController.text = producto['precio'].toString();
  stockController.text = producto['stock'].toString();
  distribuidoraController.text = producto['distribuidora'];

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: bgColor,
      title: Text("Editar producto"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nombreController,
            decoration: InputDecoration(labelText: "Nombre"),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: precioController,
            decoration: InputDecoration(labelText: "Precio"),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: stockController,
            decoration: InputDecoration(labelText: "Stock"),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: distribuidoraController,
            decoration: InputDecoration(labelText: "Distribuidora"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Cierra el diálogo
          },
          child: Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            // Agrega aquí la lógica para guardar los cambios
            Navigator.pop(context); // Cierra el diálogo
            _showSuccessSnackBar(context);
          },
          child: Text("Guardar"),
        ),
      ],
    ),
  );
}

void _showSuccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text("Se editó el producto"),
      duration: Duration(seconds: 2),
    ),
  );
  NotificationManager.addNotification("Se editó el producto");
}
