import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/device_widget.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:firstapp/src/widgets/options_menubar.dart';
import 'package:firstapp/src/widgets/title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // --------------- ประกาศตัวแปร ---------------
  // ข้อมูลประกอบด้วยชื่ออุปกรณ์ เลขอุปกรณ์ สถานะการเชื่อมต่อ
  List devices = [
    {
      'name': 'Device 1',
      'id': '123456',
      'status': 'Online',
    },
    {
      'name': 'Device 2',
      'id': '654321',
      'status': 'Offline',
    },
    {
      'name': 'Device 3',
      'id': '789012',
      'status': 'Online',
    },  
    {
      'name': 'Device 1',
      'id': '123456',
      'status': 'Online',
    },
    {
      'name': 'Device 2',
      'id': '654321',
      'status': 'Offline',
    },
    {
      'name': 'Device 3',
      'id': '789012',
      'status': 'Online',
    },  
  ];
  // ข้อมูลตัวเลือกโรงพยาบาล
  List hospitals = [
    {'name': 'โรงพยาบาล 1', 'department': ['แผนก 1', 'แผนก 2']},
    {'name': 'โรงพยาบาล 2', 'department': ['แผนก 3', 'แผนก 4']},
    {'name': 'โรงพยาบาล 3', 'department': ['แผนก 5']},
    {'name': 'โรงพยาบาล 4', 'department': ['แผนก 1', 'แผนก 2']},
    {'name': 'โรงพยาบาล 5', 'department': ['แผนก 3', 'แผนก 4']},
  ];
  String hospitalSelected = 'โรงพยาบาล 1';
  String departmentSelected = 'แผนก 1';
  // ข้อมูลรายการแผนกของโรงพยาบาลที่เลือก
  List<DropdownMenuEntry<String>> departmentEntries = [];
  // เช็คว่าเป็นแท็บเล็ตหรือไม่
  bool isTablet = false;

  @override
  void initState() {
    super.initState();
    // กำหนดค่าเริ่มต้นของ departmentEntries ตามโรงพยาบาลที่เลือก
    departmentEntries = hospitals.first['department'].map<DropdownMenuEntry<String>>(() {
      return DropdownMenuEntry<String>(
        value: departmentSelected,
        label: departmentSelected
      ); 
    }).tolist();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width > 600? isTablet = true : isTablet = false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // แสดงหัวข้อชื่อผู้ใช้ รูปโปรไฟล์ และเมนูแจ้งเตือนและตั้งค่า
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 20,
                      bottom: 12,
                    ),
                    width: width,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: secColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleName(),
                        OptionsMenubar(),
                      ],
                    ),
                  ),
          
                  // Randomized green circles
                  // สุ่มตำแหน่งวงกลมสีเขียว
                  for (int i = 0; i < 5; i++)
                    Positioned(
                      top: height * (0.05 + 0.15 * (i / 5)) + (height * 0.1 * (i % 2 == 0 ? 1 : -1)),
                      left: width * (0.1 + 0.2 * (i / 5)) + (width * 0.1 * (i % 2 == 0 ? -1 : 1)),
                      child: Container(
                      width: (40 + (10 * i)).toDouble(),
                      height: (40 + (10 * i)).toDouble(),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(125, 170, 242, 1).withOpacity(0.5),
                      ),
                      child: Text(''),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),

              // ตัวเลือกโรงพยาบาลและวอด
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Text('เลือกโรงพยาบาล', style: TextStyle(fontSize: isTablet? 20 : 16, fontWeight: FontWeight.w700),),
                    DropdownMenu<String>(
                      initialSelection: hospitalSelected, 
                      width: isTablet? width * 0.4 : width * 0.8,
                      dropdownMenuEntries: hospitals.map((hospital) {
                        return DropdownMenuEntry<String>(
                          value: hospital['name'],
                          label: hospital['name'],
                        );
                      }).toList(),
                      onSelected: (value) {
                        for (var hospital in hospitals) {
                          if(hospital['name'] == value) {
                            setState(() {
                              hospitalSelected = value!;
                              departmentSelected = hospital['department'][0];
                              departmentEntries = hospital['department'].map<DropdownMenuEntry<String>>((department) {
                                return DropdownMenuEntry<String>(
                                  value: department,
                                  label: department,
                                );
                              }).toList();
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 20,),
                    Text('เลือกแผนก', style: TextStyle(fontSize: isTablet? 20 : 16, fontWeight: FontWeight.w700),),
                    const SizedBox(height: 10,),
                    DropdownMenu<String>(
                      initialSelection: departmentSelected,
                      width: isTablet? width * 0.4 : width * 0.8,
                      dropdownMenuEntries: departmentEntries,
                      onSelected: (value) {
                        setState(() {
                          departmentSelected = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 25,),
                  ],
                ),
              ),
          
              // แสดงข้อมูลรายการอุปกรณ์ที่มีทั้งหมด
              Expanded(
                child: ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        print('Device ID: ${devices[i]['id']}');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 8,
                        color: Colors.white,
                        shadowColor: Color.fromRGBO(181, 181, 181, 0.5),
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(0),
                            width: isTablet? 80 : 70,
                            height: isTablet? 110 : 100,
                            decoration: BoxDecoration(
                              color: fourColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(''),
                          ),
                          title: Text(devices[i]['name'], style: TextStyle(fontSize: isTablet? 18 : 14, fontWeight: FontWeight.w700),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${devices[i]['id']}', style: TextStyle(fontSize: isTablet? 18 : 14),),
                              Text('-', style: TextStyle(fontSize: isTablet? 18 : 14),),  
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconText(icon: Icons.percent, text: '25', color: Colors.black, size: isTablet? 17 : 15, fontSize: isTablet? 16 : 13,),
                                  IconText(icon: Icons.person, text: '1', color: Colors.black, size: isTablet? 17 : 15, fontSize: isTablet? 16 : 13,),
                                  IconText(icon: Icons.celebration, text: '10', color: Colors.black, size: isTablet? 17 : 15, fontSize: isTablet? 16 : 13,),
                                  IconText(icon: Icons.access_alarm, text: '2', color: Colors.black, size: isTablet? 17 : 15, fontSize: isTablet? 16 : 13,),
                                  devices[i]['status'] == 'Offline'? DeviceStatus(bgColor: Colors.red, textColor: Colors.white, status: devices[i]['status'], fontSize: isTablet? 15 : 12) : DeviceStatus(bgColor: Colors.green, textColor: Colors.white, status: devices[i]['status'], fontSize: isTablet? 15 : 12),                                     
                                ],  
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
