import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:firstapp/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProbeSetting extends StatefulWidget {
  const ProbeSetting({super.key});

  @override
  State<ProbeSetting> createState() => _ProbeSettingState();
}

class _ProbeSettingState extends State<ProbeSetting> {
  // --------------- ตัวแปร ---------------
  // แจ้งอุณหภูมิกลับช่วงเข้า
  bool temEntryNoti = true;
  // การแจ้งเตือน
  bool isNotification = true;
  // ช่วงนาทีที่เลือกได้
  List<int> mins = [0,5,10,15,20,25,30];
  // วันที่เลือกแจ้งเตือนได้
  List<String> days = ['MON','TUE','WED','THU','FRI','SAT','SUN','OFF'];

  // หน่วงการแจ้งเตือนครั้งแรก
  int delayfirstNoti = 0;
  // แจ้งเตือนซ้ำ (ทุกกี่นาที)
  int repeatNoti = 0;
  // แจ้งเตือนทุกวัน หรือไม่?
  bool isDairyNoti = true;
  // แจ้งเตือนที่วันที่ 1
  String firstDayNoti = 'MON';
  // เวลาเริ่มต้นช่วงที่ 1
  TimeOfDay firstTime = TimeOfDay(hour: 8, minute: 0);
  // แจ้งเตือนที่วันที่ 2
  String secondDayNoti = 'TUE';
  // เวลาเริ่มต้นช่วงที่ 2
  TimeOfDay secondTime = TimeOfDay(hour: 12, minute: 0);
  // แจ้งเตือนที่วันที่ 3
  String thirdDayNoti = 'FRI';
  // เวลาเริ่มต้นช่วงที่ 3
  TimeOfDay thirdTime = TimeOfDay(hour: 17, minute: 0);

  BarCustom tabbarBottomAppbar = BarCustom();
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  // เลือกตัวเวลา
  Future<TimeOfDay?> _selectTime(BuildContext context, TimeOfDay time) async {
    return await showTimePicker(
      context: context,
      initialTime: time,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarBottomAppbar.appBarCustom(context, 'ตั้งค่าโพรบ', [
          TabItem(title: 'โพรบ 1'),
          TabItem(title: 'โพรบ 2'),
        ], null),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            probSreen(),
            probSreen(),
          ],
        ),
      ),
    );
  }

  // สร้างหน้า Widget ทั้งหน้าต่อ 1 Probe
  Widget probSreen() {
    return Column(
      children: [
        // เนื้อหาการตั้งค่า
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            children: [
              const SizedBox(height: 15,),
              // ปุ่มเซฟการตั้งค่า Probe
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('🔔 ตั้งค่าการแจ้งเตือน', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secColor),),

                  ElevatedButton.icon(
                    onPressed: () {
                      print('🔘 เปิดแจ้งเตือน: ${isNotification ? "เปิด" : "ปิด"}');
                      print('🌡 แจ้งอุณหภูมิช่วงเข้า: ${temEntryNoti ? "เปิด" : "ปิด"}');
                      print('🔁 แจ้งเตือนทุกวัน: ${isDairyNoti ? "ใช่" : "ไม่ใช่"}');
                      print('🕒 หน่วงการแจ้งครั้งแรก: $delayfirstNoti นาที');
                      print('🔄 แจ้งเตือนซ้ำทุก: ${repeatNoti > 0 ? "$repeatNoti นาที" : "ไม่แจ้งซ้ำ"}');

                      print('📆 วันที่และเวลาการแจ้งเตือน');
                      print('1️⃣ วัน: $firstDayNoti $secondDayNoti $thirdDayNoti');
                      print('เวลา: เวลา: ${firstTime.hour.toString().padLeft(2, '0')}:${firstTime.minute.toString().padLeft(2, '0')} น.\n${secondTime.hour.toString().padLeft(2, '0')}:${secondTime.minute.toString().padLeft(2, '0')} น.\n${thirdTime.hour.toString().padLeft(2, '0')}:${thirdTime.minute.toString().padLeft(2, '0')} น.');

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ บันทึกการตั้งค่าเรียบร้อยแล้ว'),behavior: SnackBarBehavior.floating,));
                    },
                    icon: const Icon(Icons.save,color: Colors.white,size: 30,),
                    label: const Text('บันทึก',style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(backgroundColor: threeColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8), elevation: 2,),
                  ),
                ],
              ),

              _buildSettingCard([
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'แจ้งอุณหภูมิกลับช่วงเข้า', 
                  trailing: CustomSwitch(
                    value: temEntryNoti, 
                    onChanged: (value) {
                      String txt = temEntryNoti ? 'ปิด' : 'เปิด';
                      systemwidgetcustom.showDialogConfirm(
                        context,
                        '$txtการตั้งค่า',
                        'ท่านต้องการ$txtการตั้งค่าหรือไม่?',
                        () {
                          setState(() {
                            temEntryNoti = value;
                          });
                          Navigator.pop(context);
                        },
                        primaryColor,
                        const Color.fromRGBO(255, 99, 71, 1),
                      );
                    },
                    inactiveColor: Colors.grey.shade400,
                    thumbColor: Colors.white,
                    activeColor: threeColor.withOpacity(0.5),
                  )
                ),
                const SizedBox(height: 10,),
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'การแจ้งเตือน', 
                  trailing: CustomSwitch(
                    value: isNotification, 
                    onChanged: (value) {
                      String txt = isNotification ? 'ปิด' : 'เปิด';
                      systemwidgetcustom.showDialogConfirm(
                        context,
                        '$txtการตั้งค่า',
                        'ท่านต้องการ$txtการตั้งค่าหรือไม่?',
                        () {
                          setState(() {
                            isNotification = value;
                          });
                          Navigator.pop(context);
                        },
                        primaryColor,
                        const Color.fromRGBO(255, 99, 71, 1),
                      );
                    },
                    inactiveColor: Colors.grey.shade400,
                    thumbColor: Colors.white,
                    activeColor: threeColor.withOpacity(0.5),
                  )
                ),
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'หน่วงการแจ้งเตือนครั้งแรก', 
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: delayfirstNoti,
                      items: mins.map((min) {
                        return DropdownMenuItem<int>(
                          value: min,
                          child: Text(min.toString(), style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        if(newValue != null) {
                          setState(() {
                            delayfirstNoti = newValue;
                          });
                        }
                      },
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'แจ้งเตือนซ้ำ', 
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: repeatNoti,
                      items: mins.map((min) {
                        return DropdownMenuItem<int>(
                          value: min,
                          child: Text(min.toString(), style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        if(newValue != null) {
                          setState(() {
                            repeatNoti = newValue;
                          });
                        }
                      },
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ]),

              // ตั้งค่ารีพอร์ตอัตโนมัติ
              _buildMainTitle('📄 ตั้งค่ารีพอร์ตอัตโนมัติ'),
              _buildSettingCard([
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'แจ้งเตือนทุกวันหรือไม่', 
                  trailing: CustomSwitch(
                    value: isDairyNoti, 
                    onChanged: (value) {
                      String txt = isDairyNoti ? 'ปิด' : 'เปิด';
                      systemwidgetcustom.showDialogConfirm(
                        context,
                        '$txtการตั้งค่า',
                        'ท่านต้องการ$txtการตั้งค่าหรือไม่?',
                        () {
                          setState(() {
                            isDairyNoti = value;
                          });
                          Navigator.pop(context);
                        },
                        primaryColor,
                        const Color.fromRGBO(255, 99, 71, 1),
                      );
                    },
                    inactiveColor: Colors.grey.shade400,
                    thumbColor: Colors.white,
                    activeColor: threeColor.withOpacity(0.5),
                  )
                ),
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'วันแรกที่แจ้งเตือน', 
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: firstDayNoti,
                      items: days.map((day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day, style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if(newValue != null) {
                          setState(() {
                            firstDayNoti = newValue;
                          });
                        }
                      },
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'วันที่สองที่แจ้งเตือน', 
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: secondDayNoti,
                      items: days.map((day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day, style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if(newValue != null) {
                          setState(() {
                            secondDayNoti = newValue;
                          });
                        }
                      },
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                _buildRowSetting(
                  icon: Icons.thermostat, 
                  title: 'วันที่สามที่แจ้งเตือน', 
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: thirdDayNoti,
                      items: days.map((day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day, style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if(newValue != null) {
                          setState(() {
                            thirdDayNoti = newValue;
                          });
                        }
                      },
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                // ตัวตั้งค่าเวลา
                _buildSubTitle('ตั้งค่าเวลา'),
                _buildRowSetting(
                  icon: Icons.timer, 
                  title: 'แจ้งเวลาที่หนึ่ง', 
                  trailing: GestureDetector(
                    onTap: () async {
                      // ตัวเลือกเวลาเก็บในตัวแปร
                      final TimeOfDay? picked = await _selectTime(context, firstTime);

                      // เปลี่ยนแปลงเวลา
                      if(picked != null && picked != firstTime) {
                        setState(() {
                          firstTime = picked;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          '${firstTime.hour.toString().padLeft(2, '0')}.${firstTime.minute.toString().padLeft(2, '0')} น.',
                          style: const TextStyle(
                            color: secColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: secColor),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                _buildRowSetting(
                  icon: Icons.timer, 
                  title: 'แจ้งเวลาที่สอง', 
                  trailing: GestureDetector(
                    onTap: () async {
                      // ตัวเลือกเวลาเก็บในตัวแปร
                      final TimeOfDay? picked = await _selectTime(context, secondTime);

                      // เปลี่ยนแปลงเวลา
                      if(picked != null && picked != secondTime) {
                        setState(() {
                          secondTime = picked;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          '${secondTime.hour.toString().padLeft(2, '0')}.${secondTime.minute.toString().padLeft(2, '0')} น.',
                          style: const TextStyle(
                            color: secColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: secColor),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                _buildRowSetting(
                  icon: Icons.timer, 
                  title: 'แจ้งเวลาที่สาม', 
                  trailing: GestureDetector(
                    onTap: () async {
                      // ตัวเลือกเวลาเก็บในตัวแปร
                      final TimeOfDay? picked = await _selectTime(context, thirdTime);

                      // เปลี่ยนแปลงเวลา
                      if(picked != null && picked != thirdTime) {
                        setState(() {
                          thirdTime = picked;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          '${thirdTime.hour.toString().padLeft(2, '0')}.${thirdTime.minute.toString().padLeft(2, '0')} น.',
                          style: const TextStyle(
                            color: secColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: secColor),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  // สร้าง Widget หัวข้อใหญ่
  Widget _buildMainTitle(String title) {
    return Padding(padding: const EdgeInsets.only(top: 24,bottom: 8), child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secColor),),);
  }

  // สร้าง Widget หัวข้อย่อย
  Widget _buildSubTitle(String title) {
    return Padding(padding: const EdgeInsets.only(top: 24,bottom: 8), child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secColor),),);
  }

  // กล่องพื้นหลังแยก
  Widget _buildSettingCard(List<Widget> widgets) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets,),),
    );
  }

  // การตั้งค่าเป็นแถว
  Widget _buildRowSetting({required IconData icon, required String title, required Widget trailing}) {
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