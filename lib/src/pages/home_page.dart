import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/options_menubar.dart';
import 'package:firstapp/src/widgets/title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigh = MediaQuery.of(context).size.height;
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
                    height: heigh * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: threeColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleName(),
                        OptionsMenubar(
                          selectedItem: CustomPopupMenuItem(
                            title: 'ตั้งค่า',
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 20,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Randomized green circles
                  // สุ่มตำแหน่งวงกลมสีเขียว
                  for (int i = 0; i < 5; i++)
                    Positioned(
                      top: heigh * (0.05 + 0.15 * (i / 5)) + (heigh * 0.1 * (i % 2 == 0 ? 1 : -1)),
                      left: width * (0.1 + 0.2 * (i / 5)) + (width * 0.1 * (i % 2 == 0 ? -1 : 1)),
                      child: Container(
                      width: (40 + (10 * i)).toDouble(),
                      height: (40 + (10 * i)).toDouble(),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(
                        101,
                        211,
                        173,
                        1,
                        ).withOpacity(0.5),
                      ),
                      child: Text(''),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 30),

              // แสดงข้อมูลรายการอุปกรณ์ที่มีทั้งหมด
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: secColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text('data'),
                ),
                title: Text('title'),
                subtitle: Text('sub title'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
