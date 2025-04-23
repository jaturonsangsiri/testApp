import 'package:firstapp/src/bloc/probe_setting_bloc.dart';
import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/probe_setting/setting_sub_widget.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportSetting extends StatelessWidget {
  const ReportSetting({super.key,});

  // เลือกตัวเวลา
  Future<TimeOfDay?> _selectTime(BuildContext context, TimeOfDay time) async {
    return await showTimePicker(
      context: context,
      initialTime: time,
    );
  }

  @override
  Widget build(BuildContext context) {
    SettingSubWidget settingSubWidget = SettingSubWidget();
    // วันที่เลือกแจ้งเตือนได้
    List<String> days = ['MON','TUE','WED','THU','FRI','SAT','SUN','OFF'];
    return BlocBuilder<ProbeSettingBloc, ProbeSettingState>(
      builder: (context, state) {
        return settingSubWidget.buildSettingCard([
          // ตั้งค่ารีพอร์ตอัตโนมัติ
          settingSubWidget.buildMainTitle('📄 ตั้งค่ารีพอร์ตอัตโนมัติ'),
          settingSubWidget.buildRowSetting(
              icon: Icons.thermostat, 
              title: 'แจ้งเตือนทุกวันหรือไม่', 
              trailing: CustomSwitch(
                value: state.isDairyNoti, 
                onChanged: (value) => context.read<ProbeSettingBloc>().add(SetValues(isDairyNoti: value)),
                inactiveColor: Colors.grey.shade400,
                thumbColor: Colors.white,
                activeColor: threeColor,
              )
            ),
            settingSubWidget.buildRowSetting(
              icon: Icons.thermostat, 
              title: 'วันแรกที่แจ้งเตือน', 
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: state.firstDayNoti,
                  items: days.map((day) {
                    return DropdownMenuItem<String>(
                      value: day,
                      child: Text(day, style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) => context.read<ProbeSettingBloc>().add(SetValues(firstDayNoti: newValue)),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            settingSubWidget.buildRowSetting(
              icon: Icons.thermostat, 
              title: 'วันที่สองที่แจ้งเตือน', 
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: state.secondDayNoti,
                  items: days.map((day) {
                    return DropdownMenuItem<String>(
                      value: day,
                      child: Text(day, style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) => context.read<ProbeSettingBloc>().add(SetValues(secondDayNoti: newValue)),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            settingSubWidget.buildRowSetting(
              icon: Icons.thermostat, 
              title: 'วันที่สามที่แจ้งเตือน', 
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: state.thirdDayNoti,
                  items: days.map((day) {
                    return DropdownMenuItem<String>(
                      value: day,
                      child: Text(day, style: TextStyle(color: secColor,fontWeight: FontWeight.w500),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) => context.read<ProbeSettingBloc>().add(SetValues(thirdDayNoti: newValue)),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down_outlined, color: secColor,),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            // ตัวตั้งค่าเวลา
            settingSubWidget.buildSubTitle('ตั้งค่าเวลา'),
            settingSubWidget.buildRowSetting(
              icon: Icons.timer, 
              title: 'แจ้งเวลาที่หนึ่ง', 
              trailing: GestureDetector(
                onTap: () async {
                  // ตัวเลือกเวลาเก็บในตัวแปร
                  final TimeOfDay? picked = await _selectTime(context, state.firstTime);

                  // เปลี่ยนแปลงเวลา
                  context.read<ProbeSettingBloc>().add(SetValues(firstTime: picked));
                },
                child: Row(
                  children: [
                    Text(
                      '${state.firstTime.hour.toString().padLeft(2, '0')}.${state.firstTime.minute.toString().padLeft(2, '0')} น.',
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
            settingSubWidget.buildRowSetting(
              icon: Icons.timer, 
              title: 'แจ้งเวลาที่สอง', 
              trailing: GestureDetector(
                onTap: () async {
                  // ตัวเลือกเวลาเก็บในตัวแปร
                  final TimeOfDay? picked = await _selectTime(context, state.secondTime);

                  // เปลี่ยนแปลงเวลา
                  context.read<ProbeSettingBloc>().add(SetValues(secondTime: picked));
                },
                child: Row(
                  children: [
                    Text(
                      '${state.secondTime.hour.toString().padLeft(2, '0')}.${state.secondTime.minute.toString().padLeft(2, '0')} น.',
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
            settingSubWidget.buildRowSetting(
              icon: Icons.timer, 
              title: 'แจ้งเวลาที่สาม', 
              trailing: GestureDetector(
                onTap: () async {
                  // ตัวเลือกเวลาเก็บในตัวแปร
                  final TimeOfDay? picked = await _selectTime(context, state.thirdTime);

                  // เปลี่ยนแปลงเวลา
                  context.read<ProbeSettingBloc>().add(SetValues(thirdTime: picked));
                },
                child: Row(
                  children: [
                    Text(
                      '${state.thirdTime.hour.toString().padLeft(2, '0')}.${state.thirdTime.minute.toString().padLeft(2, '0')} น.',
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
        ]);
      },
    );
  }
}