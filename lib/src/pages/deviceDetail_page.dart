import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/probe_setting.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:flutter/material.dart';

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

    return DefaultTabController(
      length: 2,
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
                    TabItem(title: 'โพรบ 2'),
                  ]
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('หน้า 1'),),
            Center(child: Text('หน้า 2'),),
          ],
        ),
      ),
    );
  }
}