import 'package:daasd12/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class NewDato extends StatefulWidget {
  const NewDato({
    Key? key,
  }) : super(key: key);

  @override
  _NewDatoState createState() => _NewDatoState();
}

class _NewDatoState extends State<NewDato> {
  bool _showForm = false;

  void _toggleFormVisibility() {
    setState(() {
      _showForm = !_showForm;
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
              onPressed: _toggleFormVisibility,
              icon: Icon(Icons.add),
              label: Text("Añadir"),
            ),
          ],
        ),
        if (_showForm) FormWidget(),
      ],
    );
  }
}

class FormWidget extends StatelessWidget {
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
          // Agrega los campos de formulario necesarios aquí
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Precio',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'stock',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'distribuidora',
            ),
          ),
          SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              // Agrega la lógica para guardar los datos del formulario aquí

            _showSuccessSnackBar(context);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }

  

  void _showSuccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text("Changes saved successfully"),
      duration: Duration(seconds: 2),
    ),
  );
}
   
}


