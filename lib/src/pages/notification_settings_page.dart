import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/services/preference.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  // ลิสต์การตั้งค่าการแจ้งเตือน
  List<Map> settings = [];
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();
  final configStorage = ConfigStorage();
  bool notification = false, door = false, legacy = false;
  String role = "";

  // ดึงค่าการตั้งค่าการแจ้งเตือน
  Future<void> loadingNotificationSettings() async {
    setState(() => settings = []);
    notification = await configStorage.getNotificationStatus() ?? false;
    door = await configStorage.getDoorStatus() ?? false;
    legacy = await configStorage.getLegacyStatus() ?? false;
    role = await configStorage.getRole() ?? "";

    // ถ้าเป็น Role  
    if(role != "LEGACY_USER" || role != "LEGACY_ADMIN") {
      settings = [{"title": "การแจ้งเตือนอุณหภูมิ","value": notification},{"title": "การแจ้งเตือนประตู","value": door}];
    }

    if(role == "SERVICE" || role == "SUPER") {
      settings = [{"title": "การแจ้งเตือนอุณหภูมิ","value": notification},{"title": "การแจ้งเตือนประตู","value": door},{"title": "การแจ้งเตือนระบบ Line","value": legacy}];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadingNotificationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การตั้งค่าแจ้งเตือน',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white,),onPressed: () => Navigator.pop(context),),
      ),
      body: settings.isEmpty? Center(child: Text('ไม่มีข้อมูล'),) : ListView.separated(
        itemCount: settings.length,
        itemBuilder: (context, index) => buildNotificationSetting(settings[index]),
        separatorBuilder: (context, index) => Divider(color: Colors.grey[300], thickness: 0),
      ),
    );
  }

  // widget สำหรับการสร้างการตั้งค่าการแจ้งเตือน
  Widget buildNotificationSetting(Map setting) {
    return ListTile(
      title: Text(setting['title'], style: Theme.of(context).textTheme.bodyLarge),
      trailing: CustomSwitch(
        value: setting['value'],
        onChanged: (val) async {
          if(setting['title'] == "การแจ้งเตือนอุณหภูมิ") {
            await configStorage.setNotification(val);
          } else if(setting['title'] == "การแจ้งเตือนประตู") {
            await configStorage.setDoorNotification(val);
          } else {
            await configStorage.setLegacyNotification(val);
          }

          await loadingNotificationSettings(); // โหลดค่าล่าสุด
        },
        inactiveColor: Colors.grey.shade400,  
        thumbColor: Colors.white,
        activeColor: threeColor,
      ),
    );
  }
}