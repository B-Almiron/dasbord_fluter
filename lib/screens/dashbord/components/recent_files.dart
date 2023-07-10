


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/RecentFile.dart';
import '../../notificat/components/table_notifi.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    super.key,
  }) ;

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
                  label: Text("File Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Options"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(context, demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(BuildContext context, RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date)),
      DataCell(Text(fileInfo.size)),
      DataCell(
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(context, fileInfo);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Agrega aquí la lógica para eliminar el archivo
              },
            ),
          ],
        ),
      ),
    ],
  );
}

void _showEditDialog(BuildContext context, RecentFile fileInfo) {
  TextEditingController fileNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  fileNameController.text = fileInfo.title;
  dateController.text = fileInfo.date;
  sizeController.text = fileInfo.size;


  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: bgColor,
      title: Text("Edit File"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          TextFormField(
            controller: fileNameController,
            decoration: InputDecoration(labelText: "File Name"),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: dateController,
            decoration: InputDecoration(labelText: "Date"),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: sizeController,
            decoration: InputDecoration(labelText: "Size"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Cierra el diálogo
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            // Agrega aquí la lógica para guardar los cambios
            Navigator.pop(context); // Cierra el diálogo
            _showSuccessSnackBar(context);
          },
          child: Text("Save"),
        ),
      ],
    ),
  );
}

void _showSuccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text("Se creo un edito un dato"),
      duration: Duration(seconds: 2),
    ),
    
  );
  NotificationManager.addNotification("Se creo un edito un dato");
}


