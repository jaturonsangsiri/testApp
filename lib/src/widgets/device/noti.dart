import 'package:firstapp/src/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
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
  NotificationWidget notificationWidget = NotificationWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var noti in notifications)
              notificationWidget.buildNotificationWidget(
                noti['title'],
                noti['message'],
                noti['datetime'].split(' ')[0],
                noti['datetime'].split(' ')[1],
              ),
          ],
        ),
      ),
    );
  }
}