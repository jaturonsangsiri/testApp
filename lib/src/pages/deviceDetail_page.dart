import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/probe_setting.dart';
import 'package:firstapp/src/widgets/device_widget.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DevicedetailPage extends StatefulWidget {
  // ข้อมูลอุปกรณ์ที่ส่งมาจากหน้าแรก
  final Map<String, dynamic> deviceData;
  const DevicedetailPage({super.key, required this.deviceData});

  @override
  // ignore: no_logic_in_create_state
  State<DevicedetailPage> createState() => _DevicedetailPageState(deviceData: deviceData);
}

class _DevicedetailPageState extends State<DevicedetailPage> {
  final Map<String, dynamic> deviceData;
_DevicedetailPageState({required this.deviceData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isTablet = width > 600 ? true : false;
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

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white,),),
          actions: [IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProbeSetting())), icon: Icon(Icons.settings, color: Colors.white))],
          title: Text('${deviceData['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          backgroundColor: secColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40), 
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.green.shade100),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: threeColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color.fromARGB(255, 94, 94, 94),
                  tabs: [
                    TabItem(title: 'โพรบ 1'),
                  ]
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            DeviceDetailWidget(deviceData: deviceData,notifications: notifications,),
          ],
        ),
      ),
    );
  }
}