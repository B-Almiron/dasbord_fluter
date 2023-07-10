import 'package:flutter/material.dart';

class NotificationTable extends StatefulWidget {
  @override
  _NotificationTableState createState() => _NotificationTableState();
}

class _NotificationTableState extends State<NotificationTable> {
  List<String> notifications = [];

  void addNotification(String notification) {
    setState(() {
      notifications.add(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla de Notificaciones'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simulación de cambio exitoso
          String newNotification = 'Cambio exitoso ${notifications.length + 1}';
          addNotification(newNotification);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
