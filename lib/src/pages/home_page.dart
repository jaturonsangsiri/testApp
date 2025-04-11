import 'package:firstapp/src/bloc/layout_bloc.dart';
import 'package:firstapp/src/bloc/layout_event.dart';
import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/options_menubar.dart';
import 'package:firstapp/src/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ประกาศตัวแปร
  // ข้อมูลประกอบด้วยชื่ออุปกรณ์ เลขอุปกรณ์ สถานะการเชื่อมต่อ
  List devices = [
    {
      'name': 'Device 1',
      'id': '123456',
      'status': 'Connected',
    },
    {
      'name': 'Device 2',
      'id': '654321',
      'status': 'Disconnected',
    },
    {
      'name': 'Device 3',
      'id': '789012',
      'status': 'Connected',
    },  
  ];
  // เช็คว่าเป็นแท็บเล็ตหรือไม่
  bool isTablet = false;

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

              // แสดงข้อมูลรายการอุปกรณ์ที่มีทั้งหมด
              for(int i =0; i < devices.length; i++)
                ListTile(
                  onTap: () {
                    
                  },
                  leading: Container(
                    width: isTablet? 80 : 50,
                    height: isTablet? 80 : 50,
                    decoration: BoxDecoration(
                      color: fourColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(''),
                  ),
                  title: Text(devices[i]['name'], style: TextStyle(fontSize: isTablet? 18 : 14),),
                  subtitle: Text('ID: ${devices[i]['id']}', style: TextStyle(fontSize: isTablet? 18 : 14),),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
