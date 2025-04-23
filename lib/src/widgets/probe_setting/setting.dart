import 'package:firstapp/src/widgets/probe_setting/notification_setting.dart';
import 'package:firstapp/src/widgets/probe_setting/report_setting.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // แจ้งอุณหภูมิกลับช่วงเข้า
  bool temEntryNoti = true;
  // การแจ้งเตือน
  bool isNotification = true;
  // หน่วงการแจ้งเตือนครั้งแรก
  int delayfirstNoti = 0;
  // แจ้งเตือนซ้ำ (ทุกกี่นาที)
  int repeatNoti = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // เนื้อหาการตั้งค่า
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 5,right: 5),
            children: [
              NotificationSetting(),
              ReportSetting(),
            ],
          ),
        ),
      ],
    );
  }
}