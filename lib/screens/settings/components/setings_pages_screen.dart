import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          
          Text(
            'Settings Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Darshboard parte superior

          SizedBox(
            height: defaultPadding,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Darshboard parte izquierda
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Column1(),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    if (Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context)) Column2()
                  ],
                ),
              ),

              if (!Responsive.isMobile(context))
                SizedBox(
                  width: defaultPadding,
                ),

              // Darshboard parte derecha
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 1,
                  child: Column2(),
                ),
            ],
          )
        ]),
      ),
    );
  }
}

class Column1 extends StatefulWidget {
  const Column1({
    super.key,
  }) ;

  @override
  _Column1State createState() => _Column1State();
}

class _Column1State extends State<Column1> {
  List<String> _listItems = [
    'Elemento 1',
    'Elemento 2',
    'Elemento 3',
  ];
  List<String> _checkedItems = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Columna 1',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Column(
          children: _listItems.map((item) {
            return CheckboxListTile(
              title: Text(item),
              value: _checkedItems.contains(item),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    _checkedItems.add(item);
                  } else {
                    _checkedItems.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}





class Column2 extends StatefulWidget {
  const Column2({
    super.key,
  });

  @override
  _Column2State createState() => _Column2State();
}

class _Column2State extends State<Column2> {
  bool _switchValue = false;
  bool _switchValue2 = false;

  List<String> _listItems = [
    'Elemento 1',
    'Elemento 2',
    'Elemento 3',
  ];

  List<String> _sublistItems = [
    'Subelemento 1',
    'Subelemento 2',
    'Subelemento 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Columna 2',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Activar'),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Activar2'),
            Switch(
              value: _switchValue2,
              onChanged: (value) {
                setState(() {
                  _switchValue2 = value;
                });
              },
            ),
          ],
        ),
        
        
        SizedBox(height: 16),
        Text('Lista de elementos:'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _listItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_listItems[index]),
              onTap: () {
                // Handle list item tap
              },
            );
          },
        ),
        SizedBox(height: 16),
        Text('Sublista de elementos:'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _sublistItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_sublistItems[index]),
              onTap: () {
                // Handle sublist item tap
              },
            );
          },
        ),
      ],
    );
  }
}
