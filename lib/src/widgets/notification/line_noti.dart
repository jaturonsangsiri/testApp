import 'package:firstapp/src/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class LineNoti extends StatefulWidget {
  const LineNoti({super.key});

  @override
  State<LineNoti> createState() => _LineNotiState();
}

class _LineNotiState extends State<LineNoti> {
  NotificationWidget notificationWidget = NotificationWidget();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var noti in notificationsLine)
          notificationWidget.buildNotificationWidget(noti['title'], noti['message'], noti['datetime'].split(' ')[0], noti['datetime'].split(' ')[1]),
      ],
    );
  }
}