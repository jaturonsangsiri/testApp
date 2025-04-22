import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/device_detail_page.dart';
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
  List devices = [];
  // ข้อมูลตัวเลือกโรงพยาบาล
  List<Map> hospitals = [
    {
      'name': 'โรงพยาบาล 1',
      'department': [
        {
          'name': 'แผนกฉุกเฉิน',
          'devices': [
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องช่วยหายใจ',
              'id': 'A1001',
              'status': 'Online',
              'location': 'ห้องฉุกเฉิน 101',
              'temperature': 5.5,
              'humidity': 72.1,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 0,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดความดัน',
              'id': 'A1002',
              'status': 'Offline',
              'location': 'ตู้เก็บอุปกรณ์',
              'temperature': 8.3,
              'humidity': 65.9,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
          ]
        },
        {
          'name': 'แผนกอายุรกรรม',
          'devices': [
            {
              'name': 'เครื่องตรวจหัวใจ',
              'id': 'A1003',
              'status': 'Online',
              'location': 'ชั้น 2 ห้อง 204',
              'temperature': 4.9,
              'humidity': 60.3,
              'lowest_temp': 3,
              'highest_temp': 40,
              'lowest_humi': 20,
              'highest_humi': 95
            },
            {
              'name': 'อุปกรณ์ช่วยพยุง',
              'id': 'A1004',
              'status': 'Maintenance',
              'location': 'คลังพัสดุ',
              'temperature': 6.7,
              'humidity': 81.5,
              'lowest_temp': 5,
              'highest_temp': 37,
              'lowest_humi': 30,
              'highest_humi': 85
            },
          ]
        },
      ],
    },
    {
      'name': 'โรงพยาบาล 2',
      'department': [
        {
          'name': 'แผนกศัลยกรรม',
          'devices': [
            {
              'name': 'เครื่องเอกซเรย์',
              'id': 'B2001',
              'status': 'Online',
              'location': 'ห้อง X-Ray 1',
              'temperature': 7.1,
              'humidity': 59.8,
              'lowest_temp': 4,
              'highest_temp': 39,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องมือผ่าตัดไฟฟ้า',
              'id': 'B2002',
              'status': 'Offline',
              'location': 'ห้องผ่าตัดใหญ่',
              'temperature': 6.0,
              'humidity': 76.3,
              'lowest_temp': 2,
              'highest_temp': 35,
              'lowest_humi': 5,
              'highest_humi': 80
            },
          ]
        },
        {
          'name': 'แผนกเด็ก',
          'devices': [
            {
              'name': 'ตู้อบเด็กแรกเกิด',
              'id': 'B2003',
              'status': 'Online',
              'location': 'NICU',
              'temperature': 4.3,
              'humidity': 70.2,
              'lowest_temp': 2,
              'highest_temp': 34,
              'lowest_humi': 15,
              'highest_humi': 90
            },
            {
              'name': 'เครื่องวัดอุณหภูมิ',
              'id': 'B2004',
              'status': 'Error',
              'location': 'ห้องตรวจเด็ก',
              'temperature': 9.0,
              'humidity': 80.7,
              'lowest_temp': 3,
              'highest_temp': 37,
              'lowest_humi': 20,
              'highest_humi': 100
            },
          ]
        },
      ],
    },
    {
      'name': 'โรงพยาบาล 3',
      'department': [
        {
          'name': 'แผนกผู้สูงอายุ',
          'devices': [
            {
              'name': 'เตียงผู้ป่วยไฟฟ้า',
              'id': 'C3001',
              'status': 'Online',
              'location': 'ห้อง 301',
              'temperature': 5.2,
              'humidity': 69.1,
              'lowest_temp': 1,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 100
            },
            {
              'name': 'เครื่องวัดระดับน้ำตาล',
              'id': 'C3002',
              'status': 'Offline',
              'location': 'ห้องพยาบาล',
              'temperature': 6.6,
              'humidity': 74.4,
              'lowest_temp': 0,
              'highest_temp': 35,
              'lowest_humi': 5,
              'highest_humi': 90
            },
          ]
        },
      ],
    },
    {
      'name': 'โรงพยาบาล 4',
      'department': [
        {
          'name': 'แผนกทันตกรรม',
          'devices': [
            {
              'name': 'เก้าอี้ทันตกรรม',
              'id': 'D4001',
              'status': 'Online',
              'location': 'คลินิกทันตกรรม',
              'temperature': 5.0,
              'humidity': 63.5,
              'lowest_temp': 2,
              'highest_temp': 39,
              'lowest_humi': 15,
              'highest_humi': 85
            },
            {
              'name': 'เครื่องดูดน้ำลาย',
              'id': 'D4002',
              'status': 'Offline',
              'location': 'หลังคลินิก',
              'temperature': 7.3,
              'humidity': 78.9,
              'lowest_temp': 1,
              'highest_temp': 38,
              'lowest_humi': 20,
              'highest_humi': 95
            },
          ]
        },
        {
          'name': 'แผนกกายภาพบำบัด',
          'devices': [
            {
              'name': 'เครื่องกระตุ้นกล้ามเนื้อ',
              'id': 'D4003',
              'status': 'Online',
              'location': 'ชั้น 1',
              'temperature': 4.4,
              'humidity': 58.0,
              'lowest_temp': 2,
              'highest_temp': 36,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'ลู่วิ่งฟื้นฟู',
              'id': 'D4004',
              'status': 'Maintenance',
              'location': 'ห้องกายภาพ 2',
              'temperature': 5.8,
              'humidity': 66.6,
              'lowest_temp': 3,
              'highest_temp': 35,
              'lowest_humi': 5,
              'highest_humi': 85
            },
          ]
        },
      ],
    },
    {
      'name': 'โรงพยาบาล 5',
      'department': [
        {
          'name': 'แผนกสูตินรีเวช',
          'devices': [
            {
              'name': 'เครื่องอัลตร้าซาวด์',
              'id': 'E5001',
              'status': 'Online',
              'location': 'ห้องตรวจหญิง',
              'temperature': 6.1,
              'humidity': 62.2,
              'lowest_temp': 2,
              'highest_temp': 37,
              'lowest_humi': 10,
              'highest_humi': 90
            },
            {
              'name': 'เตียงคลอด',
              'id': 'E5002',
              'status': 'Offline',
              'location': 'ห้องคลอด 2',
              'temperature': 7.4,
              'humidity': 79.5,
              'lowest_temp': 3,
              'highest_temp': 36,
              'lowest_humi': 15,
              'highest_humi': 95
            },
          ]
        },
        {
          'name': 'แผนกห้องพิเศษ',
          'devices': [
            {
              'name': 'ทีวีผู้ป่วย',
              'id': 'E5003',
              'status': 'Online',
              'location': 'VIP Room A',
              'temperature': 4.7,
              'humidity': 61.3,
              'lowest_temp': 2,
              'highest_temp': 38,
              'lowest_humi': 10,
              'highest_humi': 85
            },
            {
              'name': 'เครื่องปรับอากาศ',
              'id': 'E5004',
              'status': 'Error',
              'location': 'ห้องพักผู้ป่วยพิเศษ',
              'temperature': 8.2,
              'humidity': 84.7,
              'lowest_temp': 1,
              'highest_temp': 39,
              'lowest_humi': 20,
              'highest_humi': 95
            },
          ]
        },
      ],
    },
  ];

  String hospitalSelected = 'โรงพยาบาล 1';
  String departmentSelected = 'แผนกฉุกเฉิน';
  // ข้อมูลรายการแผนกของโรงพยาบาลที่เลือก
  List<DropdownMenuEntry<String>> departmentEntries = [];
  // เช็คว่าเป็นแท็บเล็ตหรือไม่
  bool isTablet = false;
  DeviceDetailWidget deviceDetail = DeviceDetailWidget();

  // เซ็ตค่าเริ่มต้นของโรงพยาบาลและแผนก
  void setDefault() {
    hospitalSelected = hospitals.first['name'];
    departmentSelected = hospitals.first['department'].first['name'];
  }

  // ดึงข้อมูลอุปกรณ์โรงพยาบาลและแผนก
  void getHosAndDevice() {
    for (var hospital in hospitals) {
      if (hospital['name'] == hospitalSelected) {
        departmentEntries = hospital['department'].map<DropdownMenuEntry<String>>((department) {
          return DropdownMenuEntry<String>(
            value: department['name'],
            label: department['name'],
          ); 
        }).toList();

        for (var department in hospital['department']) {
          if(department['name'] == departmentSelected) {
            devices = department['devices'];
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setDefault();
    getHosAndDevice();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width > 600? isTablet = true : isTablet = false;
    return Scaffold(
      body: Column(
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
                    const SizedBox(width: 5,),
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
          //const SizedBox(height: 10),
            
          // ตัวเลือกโรงพยาบาลและวอด
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                DropdownMenuTheme(
                  data: DropdownMenuThemeData(menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(Colors.white),)),
                  child: DropdownMenu<String>(
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
                            departmentSelected = hospital['department'][0]['name'];
                            getHosAndDevice();
                          });
                        }
                      }
                    },
                    label: Text('โรงพยาบาล', style: TextStyle(fontSize: isTablet? 20 : 16, fontWeight: FontWeight.w700),),
                  ),
                ),
                const SizedBox(height: 10,),
                DropdownMenuTheme(
                  data: DropdownMenuThemeData(menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(Colors.white),)),
                  child: DropdownMenu<String>(
                    initialSelection: departmentSelected,
                    width: isTablet? width * 0.4 : width * 0.8,
                    dropdownMenuEntries: departmentEntries,
                    onSelected: (value) {
                      setState(() {
                        departmentSelected = value!;
                        getHosAndDevice();
                      });
                    },
                    label: Text('แผนก', style: TextStyle(fontSize: isTablet? 20 : 16, fontWeight: FontWeight.w700),),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,
          
          
          
          ),
      
          // แสดงข้อมูลรายการอุปกรณ์ที่มีทั้งหมด
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0,bottom: 0),
              itemCount: devices.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DevicedetailPage(deviceData: devices[i],))),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //elevation: 8,
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
                              DeviceStatus(bgColor: deviceDetail.getStatusColor(devices[i]['status']), textColor: Colors.white, status: devices[i]['status'], fontSize: isTablet? 15 : 12)                                     
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
    );
  }
}
