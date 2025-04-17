import 'package:flutter/material.dart';

class NotificationWidget {
  // ฟังก์ชั่น Widget ของการแจ้งเตือน
  Widget buildNotificationWidget(String title, String subtitle, String time, String date) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.green.shade400,),
      title: Text(title, style: TextStyle(fontSize: 15),),
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