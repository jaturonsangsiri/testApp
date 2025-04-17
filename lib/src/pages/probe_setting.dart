import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/systemWidgetCustom.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class ProbeSetting extends StatefulWidget {
  const ProbeSetting({super.key});

  @override
  State<ProbeSetting> createState() => _ProbeSettingState();
}

class _ProbeSettingState extends State<ProbeSetting> {
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  // ตัวเก็บการตั้งค่าของพรอบ
  List<Map> probeSettings = [
    {
      'title': 'แจ้งอุณหภูมิกลับช่วงเข้า',
      'value': false,
    },
    {
      'title': 'การแจ้งเตือน',
      'value': false,
    },
    {
      'title': 'วันที่แจ้งรีพอร์ต', // true = ทุกวัน, false = บางวัน
      'value': false,
    },
  ];

  // widget สำหรับการสร้างการตั้งค่าการแจ้งเตือน
  Widget buildProbSetting(Map prob) {
    return ListTile(
      title: Text(prob['title']),
      trailing: CustomSwitch(
        value: prob['value'],
        onChanged: (val) {
          String txt = prob['value']?'ปิด':'เปิด';
          systemwidgetcustom.showDialogConfirm(context, '$txtการตั้งค่า', 'ท่านต้องการ$txtการตั้งค่าหรือไม่?', () {
            // ปิดทั้ง Dialog และแก้ไข UI การตั้งค่า
            setState(() {
              prob['value'] = val;
            });
            Navigator.pop(context);
          }, primaryColor, const Color.fromRGBO(255, 99, 71, 1));
        },
        inactiveColor: Colors.grey.shade400,  
        thumbColor: Colors.white,
        activeColor: primaryColor.withOpacity(0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white,),),
          title: Text('ตั้งค่าโพรบ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  systemwidgetcustom.textWithIcon(Icons.notifications, 'ตั้งค่าการแจ้งเตือน', Colors.black, 20),
                  const SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text('แจ้งอุณหภูมิกลับเข้าช่วง',style: TextStyle(fontSize: 18,color: Colors.black),), CustomSwitch(value: probeSettings[0]['value'], onChanged: (value) {
                    String txt = probeSettings[0]['value']?'ปิด':'เปิด';
                    systemwidgetcustom.showDialogConfirm(context, '$txtการตั้งค่า', 'ท่านต้องการ$txtการตั้งค่าหรือไม่?', () {
                      // ปิดทั้ง Dialog และแก้ไข UI การตั้งค่า
                      setState(() {
                        probeSettings[0]['value'] = value;
                      });
                      Navigator.pop(context);
                    }, primaryColor, const Color.fromRGBO(255, 99, 71, 1));
                  },inactiveColor: Colors.grey.shade400,thumbColor: Colors.white,activeColor: primaryColor.withOpacity(0.5),) ],),
                  const SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text('การแจ้งเตือน',style: TextStyle(fontSize: 18,color: Colors.black),), CustomSwitch(value: probeSettings[1]['value'], onChanged: (value) {
                    String txt = probeSettings[1]['value']?'ปิด':'เปิด';
                    systemwidgetcustom.showDialogConfirm(context, '$txtการตั้งค่า', 'ท่านต้องการ$txtการตั้งค่าหรือไม่?', () {
                      // ปิดทั้ง Dialog และแก้ไข UI การตั้งค่า
                      setState(() {
                        probeSettings[1]['value'] = value;
                      });
                      Navigator.pop(context);
                    }, primaryColor, const Color.fromRGBO(255, 99, 71, 1));
                  },inactiveColor: Colors.grey.shade400,thumbColor: Colors.white,activeColor: primaryColor.withOpacity(0.5),) ],),
                  const SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text('หน่วงการแจ้งเตือนครั้งแรก',style: TextStyle(fontSize: 18,color: Colors.black),), CustomSwitch(value: probeSettings[1]['value'], onChanged: (value) {
                    String txt = probeSettings[1]['value']?'ปิด':'เปิด';
                    systemwidgetcustom.showDialogConfirm(context, '$txtการตั้งค่า', 'ท่านต้องการ$txtการตั้งค่าหรือไม่?', () {
                      // ปิดทั้ง Dialog และแก้ไข UI การตั้งค่า
                      setState(() {
                        probeSettings[1]['value'] = value;
                      });
                      Navigator.pop(context);
                    }, primaryColor, const Color.fromRGBO(255, 99, 71, 1));
                  },inactiveColor: Colors.grey.shade400,thumbColor: Colors.white,activeColor: primaryColor.withOpacity(0.5),) ],),
                  const SizedBox(height: 15,),
                  systemwidgetcustom.textWithIcon(Icons.access_time_outlined, 'ตั้งค่าเวลาแจ้งรีพอร์ต', Colors.black, 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}