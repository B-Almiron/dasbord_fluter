import 'package:daasd12/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../notificat/components/table_notifi.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class NewDato extends StatefulWidget {
  const NewDato({
    Key? key,
  }) : super(key: key);

  @override
  _NewDatoState createState() => _NewDatoState();
}

class _NewDatoState extends State<NewDato> {
  bool _showForm = false; // Added

  final url = Uri.parse("http://localhost:3000/usuarios/1/productos"); // Cambiado el URL
  final headers = {"Content-Type": "application/json;charset=UTF-8"};

  final nombreController = TextEditingController();
  final precioController = TextEditingController();
  final stockController = TextEditingController();
  final distribuidoraController = TextEditingController();

  void _createProducto() async {
    final String nombre = nombreController.text;
    final double precio = double.parse(precioController.text);
    final int stock = int.parse(stockController.text);
    final String distribuidora = distribuidoraController.text;

    final Map<String, dynamic> productoData = {
      'nombre': nombre,
      'precio': precio,
      'stock': stock,
      'distribuidora': distribuidora,
    };

    final response = await http.post(url,
      body: jsonEncode(productoData),
      headers: headers,
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Producto creado'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error al crear el producto'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    // Limpiar los campos del formulario después de crear el producto
    nombreController.clear();
    precioController.clear();
    stockController.clear();
    distribuidoraController.clear();

    // Actualizar la interfaz para mostrar el nuevo producto en la lista
    setState(() {
      // Aquí puedes agregar la lógica para actualizar la lista de productos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mi files ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding / (Responsive.isMobile(context) ? 1 : 2),
                ),
              ),
              onPressed: () {
                setState(() {
                  _showForm = !_showForm;
                });
              },
              icon: Icon(Icons.add),
              label: Text("Añadir"),
            ),
          ],
        ),
        if (_showForm) FormWidget(
          nombreController: nombreController,
          precioController: precioController,
          stockController: stockController,
          distribuidoraController: distribuidoraController,
          createProducto: _createProducto,
        ),
      ],
    );
  }
}

class FormWidget extends StatelessWidget {
  final TextEditingController nombreController;
  final TextEditingController precioController;
  final TextEditingController stockController;
  final TextEditingController distribuidoraController;
  final VoidCallback createProducto;

  const FormWidget({
    required this.nombreController,
    required this.precioController,
    required this.stockController,
    required this.distribuidoraController,
    required this.createProducto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Text(
            'Formulario',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: defaultPadding),
          TextFormField(
            controller: nombreController,
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          TextFormField(
            controller: precioController,
            decoration: InputDecoration(
              labelText: 'Precio',
            ),
          ),
          TextFormField(
            controller: stockController,
            decoration: InputDecoration(
              labelText: 'Stock',
            ),
          ),
          TextFormField(
            controller: distribuidoraController,
            decoration: InputDecoration(
              labelText: 'Distribuidora',
            ),
          ),
          SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: (){// Cierra el diálogo
            _showSuccessSnackBar(context);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

  

  void _showSuccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text("Se creo un nuevo dato"),
      duration: Duration(seconds: 2),
    ),
  );
  NotificationManager.addNotification("Se creo un nuevo dato");
}
   



