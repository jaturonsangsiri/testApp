import 'package:flutter/material.dart';

class NotificationWidget {
  // ฟังก์ชั่น Widget ของการแจ้งเตือน
  Widget buildNotificationWidget(BuildContext context, String title, String subtitle, String time, String date) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.green.shade400,),
      title: Text(title, style: Theme.of(context).textTheme.bodySmall,),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 14),),
      trailing: Column(
        children: [
          Text(time, style: TextStyle(fontSize: 14,),),
          Text(date, style: TextStyle(fontSize: 14,),),
        ],
      ),
    );
  }
}