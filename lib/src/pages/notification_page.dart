import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/notification_settings_page.dart';
import 'package:firstapp/src/widgets/notification_widget.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:firstapp/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationWidget notificationWidget = NotificationWidget();
  List<Map<String, dynamic>> notifications = [
    {'title': 'โรงพยาบาลศิริราช','message': 'PROBE1: แจ้งเตือนเมื่ออุณหภูมิต่ำกว่า 15 องศา','datetime': '08:30 2025-04-15'},
    {'title': 'โรงพยาบาลจุฬา','message': 'PROBE2: แจ้งเตือนเมื่ออุณหภูมิสูงเกิน 35 องศา','datetime': '10:45 2025-04-15'},
    {'title': 'โรงพยาบาลรามาธิบดี','message': 'PROBE3: แจ้งเตือนเมื่ออุณหภูมิเปลี่ยนแปลงอย่างรวดเร็ว','datetime': '14:20 2025-04-15'},
    {'title': 'โรงพยาบาลกรุงเทพ','message': 'PROBE4: แจ้งเตือนเมื่ออุณหภูมิสูงเกิน 40 องศา','datetime': '16:00 2025-04-15'},
    {'title': 'โรงพยาบาลสมิติเวช','message': 'PROBE5: แจ้งเตือนเมื่ออุณหภูมิต่ำกว่า 10 องศา','datetime': '18:15 2025-04-15'},
    {'title': 'โรงพยาบาลบำรุงราษฎร์','message': 'PROBE6: แจ้งเตือนเมื่ออุณหภูมิสูงเกิน 38 องศา','datetime': '20:00 2025-04-15'},
    {'title': 'โรงพยาบาลพญาไท','message': 'PROBE7: แจ้งเตือนเมื่ออุณหภูมิเปลี่ยนแปลงเกิน 5 องศาใน 1 ชั่วโมง','datetime': '22:10 2025-04-15'},
    {'title': 'โรงพยาบาลเวชธานี','message': 'PROBE8: แจ้งเตือนเมื่ออุณหภูมิต่ำกว่า 5 องศา','datetime': '23:45 2025-04-15'},
    {'title': 'โรงพยาบาลลาดพร้าว','message': 'PROBE9: แจ้งเตือนเมื่ออุณหภูมิสูงเกิน 37 องศา','datetime': '07:00 2025-04-16'},
    {'title': 'โรงพยาบาลเปาโล','message': 'PROBE10: แจ้งเตือนเมื่ออุณหภูมิต่ำกว่า 12 องศา','datetime': '09:25 2025-04-16'},
  ];
  List<Map<String, dynamic>> notificationsLine = [
    {'title': 'โรงพยาบาลศิริราช','message': 'PROBE1: แจ้งเตือนเมื่อความชื้นต่ำกว่า 30%','datetime': '09:00 2025-05-01'},
    {'title': 'โรงพยาบาลจุฬา','message': 'PROBE2: แจ้งเตือนเมื่อความชื้นสูงเกิน 70%','datetime': '11:15 2025-05-01'},
    {'title': 'โรงพยาบาลรามาธิบดี','message': 'PROBE3: แจ้งเตือนเมื่อความชื้นเปลี่ยนแปลงอย่างรวดเร็ว','datetime': '13:45 2025-05-01'},
    {'title': 'โรงพยาบาลกรุงเทพ','message': 'PROBE4: แจ้งเตือนเมื่อความชื้นสูงเกิน 80%','datetime': '15:30 2025-05-01'},
    {'title': 'โรงพยาบาลสมิติเวช','message': 'PROBE5: แจ้งเตือนเมื่อความชื้นต่ำกว่า 20%','datetime': '17:50 2025-05-01'},
    {'title': 'โรงพยาบาลบำรุงราษฎร์','message': 'PROBE6: แจ้งเตือนเมื่อความชื้นสูงเกิน 75%','datetime': '19:10 2025-05-01'},
    {'title': 'โรงพยาบาลพญาไท','message': 'PROBE7: แจ้งเตือนเมื่อความชื้นเปลี่ยนแปลงเกิน 10% ใน 1 ชั่วโมง','datetime': '21:25 2025-05-01'},
    {'title': 'โรงพยาบาลเวชธานี','message': 'PROBE8: แจ้งเตือนเมื่อความชื้นต่ำกว่า 15%','datetime': '23:00 2025-05-01'},
    {'title': 'โรงพยาบาลลาดพร้าว','message': 'PROBE9: แจ้งเตือนเมื่อความชื้นสูงเกิน 65%','datetime': '06:45 2025-05-02'},
    {'title': 'โรงพยาบาลเปาโล','message': 'PROBE10: แจ้งเตือนเมื่อความชื้นต่ำกว่า 25%','datetime': '08:20 2025-05-02'},
  ];
  BarCustom tabbarBottomAppbar = BarCustom();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarBottomAppbar.appBarCustom(context, 'แจ้งเตือน', [
          TabItem(title: 'eTEMP/iTemS'),
          TabItem(title: 'Line Notify'),
        ], [IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage())), icon: Icon(Icons.settings, color: Colors.white, size: 30,)), const SizedBox(width: 20,)]),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var noti in notifications)
                    notificationWidget.buildNotificationWidget(noti['title'], noti['message'], noti['datetime'].split(' ')[0], noti['datetime'].split(' ')[1]),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var noti in notificationsLine)
                    notificationWidget.buildNotificationWidget(noti['title'], noti['message'], noti['datetime'].split(' ')[0], noti['datetime'].split(' ')[1]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}