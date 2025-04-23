import 'package:firstapp/src/bloc/probe_setting_bloc.dart';
import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/probe_setting/setting_sub_widget.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key,});

  @override
  Widget build(BuildContext context) {
    SettingSubWidget settingSubWidget = SettingSubWidget();
    List<int> mins = [0,5,10,15,20,25,30];
    return BlocBuilder<ProbeSettingBloc, ProbeSettingState>(
      builder: (context, state) {
        return settingSubWidget.buildSettingCard(
          [
            // ปุ่มเซฟการตั้งค่า Probe
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('🔔 ตั้งค่าการแจ้งเตือน', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secColor),),
        
                ElevatedButton.icon(
                  onPressed: () {
                    // print('🔘 เปิดแจ้งเตือน: ${isNotification ? "เปิด" : "ปิด"}');
                    // print('🌡 แจ้งอุณหภูมิช่วงเข้า: ${TemEntryFunction ? "เปิด" : "ปิด"}');
                    // print('🔁 แจ้งเตือนทุกวัน: ${isDairyNoti ? "ใช่" : "ไม่ใช่"}');
                    // print('🕒 หน่วงการแจ้งครั้งแรก: $delayfirstNoti นาที');
                    // print('🔄 แจ้งเตือนซ้ำทุก: ${repeatNoti > 0 ? "$repeatNoti นาที" : "ไม่แจ้งซ้ำ"}');
        
                    // print('📆 วันที่และเวลาการแจ้งเตือน');
                    // print('1️⃣ วัน: $firstDayNoti $secondDayNoti $thirdDayNoti');
                    // print('เวลา: เวลา: ${firstTime.hour.toString().padLeft(2, '0')}:${firstTime.minute.toString().padLeft(2, '0')} น.\n${secondTime.hour.toString().padLeft(2, '0')}:${secondTime.minute.toString().padLeft(2, '0')} น.\n${thirdTime.hour.toString().padLeft(2, '0')}:${thirdTime.minute.toString().padLeft(2, '0')} น.');
        
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ บันทึกการตั้งค่าเรียบร้อยแล้ว'),behavior: SnackBarBehavior.floating,));
                  },
                  icon: const Icon(Icons.save,color: Colors.white,size: 30,),
                  label: const Text('บันทึก',style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(backgroundColor: threeColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8), elevation: 2,),
                ),
              ],
            ),
            const SizedBox(height: 15,),
          settingSubWidget.buildRowSetting(
            icon: Icons.thermostat, 
            title: 'แจ้งอุณหภูมิกลับช่วงเข้า', 
            trailing: CustomSwitch(
              value: state.temEntryNoti, 
              onChanged: (value) => context.read<ProbeSettingBloc>().add(SetValues(temEntryNoti: !state.temEntryNoti)),
              inactiveColor: Colors.grey.shade400,
              thumbColor: Colors.white,
              activeColor: threeColor,
            )
          ),
          const SizedBox(height: 10,),
          settingSubWidget.buildRowSetting(
            icon: Icons.thermostat, 
            title: 'การแจ้งเตือน', 
            trailing: CustomSwitch(
              value: state.isNotification, 
              onChanged: (value) => context.read<ProbeSettingBloc>().add(SetValues(isNotification: !state.isNotification)),
              inactiveColor: Colors.grey.shade400,
              thumbColor: Colors.white,
              activeColor: threeColor,
            )
          ),
          settingSubWidget.buildRowSetting(
            icon: Icons.thermostat, 
            title: 'หน่วงการแจ้งเตือนครั้งแรก', 
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: state.delayfirstNoti,
                items: mins.map((min) {
                  return DropdownMenuItem<int>(
                    value: min,
                    child: Text(min.toString(), style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                  );
                }).toList(),
                onChanged: (value) => context.read<ProbeSettingBloc>().add(SetValues(delayfirstNoti: value)),
                dropdownColor: Colors.white,
                icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          settingSubWidget.buildRowSetting(
            icon: Icons.thermostat, 
            title: 'แจ้งเตือนซ้ำ', 
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: state.repeatNoti,
                items: mins.map((min) {
                  return DropdownMenuItem<int>(
                    value: min,
                    child: Text(min.toString(), style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                  );
                }).toList(),
                onChanged: (value) => context.read<ProbeSettingBloc>().add(SetValues(repeatNoti: value)),
                dropdownColor: Colors.white,
                icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ]);
      },
    );
  }
}