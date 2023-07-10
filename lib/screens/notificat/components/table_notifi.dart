import 'package:flutter/material.dart';

import '../../../constants.dart';

class NotificationData {
  final String message;

  NotificationData(this.message);
}

class NotificationManager {
  static List<NotificationData> notifications = [];
  static ValueNotifier<List<NotificationData>> notificationsNotifier =
      ValueNotifier(notifications);

  static void addNotification(String message) {
    notifications.add(NotificationData(message));
    notificationsNotifier.value = notifications;
  }
}

class NotificationsTable extends StatelessWidget {
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
            "Notifications",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: defaultPadding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: NotificationManager.notifications.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(NotificationManager.notifications[index].message),
              );
            },
          ),
        ],
      ),
    );
  }
}


