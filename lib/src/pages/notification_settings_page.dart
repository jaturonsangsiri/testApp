import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  // ลิสต์การตั้งค่าการแจ้งเตือน
  List<Map> settings = [
    {
      'title': 'การแจ้งเตือนอุณหภูมิ',
      'value': true,
    },
    {
      'title': 'การแจ้งเตือนประตู',
      'value': false,
    },
    {
      'title': 'การแจ้งเตือนระบบ Line',
      'value': false,
    },
  ];
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  // widget สำหรับการสร้างการตั้งค่าการแจ้งเตือน
  Widget buildNotificationSetting(Map setting) {
    return ListTile(
      title: Text(setting['title']),
      trailing: CustomSwitch(
        value: setting['value'],
        onChanged: (val) {
          // String txt = setting['value']?'ปิด':'เปิด';
          // systemwidgetcustom.showDialogConfirm(context, '$txtการตั้งค่า', 'ท่านต้องการ$txtการตั้งค่าหรือไม่?', () {
          //   // ปิดทั้ง Dialog และแก้ไข UI การตั้งค่า
          //   Navigator.pop(context);
          // }, primaryColor, const Color.fromRGBO(255, 99, 71, 1));
          setState(() {
            setting['value'] = val;
          });
        },
        inactiveColor: Colors.grey.shade400,  
        thumbColor: Colors.white,
        activeColor: threeColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การตั้งค่าแจ้งเตือน',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
        backgroundColor: secColor,
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white,),onPressed: () => Navigator.pop(context),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: settings.length,
          itemBuilder: (context, index) => buildNotificationSetting(settings[index]),
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}