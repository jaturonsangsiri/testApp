import 'package:firstapp/src/constants/contants.dart';
import 'package:flutter/material.dart';

class SettingSubWidget {
  // สร้าง Widget หัวข้อใหญ่
  Widget buildMainTitle(String title) {
    return Padding(padding: const EdgeInsets.only(top: 5,bottom: 8), child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secColor),),);
  }

  // สร้าง Widget หัวข้อย่อย
  Widget buildSubTitle(String title) {
    return Padding(padding: const EdgeInsets.only(top: 5,bottom: 8), child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secColor),),);
  }

  // กล่องพื้นหลังแยก
  Widget buildSettingCard(List<Widget> widgets) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets,),),
    );
  }

  // การตั้งค่าเป็นแถว
  Widget buildRowSetting({required IconData icon, required String title, required Widget trailing}) {
    return Row(children: [
      Icon(icon,color: secColor,),
      const SizedBox(width: 16,),
      Expanded(
        child: Text(title, style: TextStyle(color: Color.fromARGB(255, 70, 70, 70), fontSize: 16, fontWeight: FontWeight.w500),),
      ),
      trailing,
    ],);
  }
}