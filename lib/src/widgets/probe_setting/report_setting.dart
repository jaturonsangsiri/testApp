import 'package:firstapp/src/bloc/probe/probe_setting_bloc.dart';
import 'package:firstapp/src/bloc/theme/theme_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
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
                trailing: dropDownWidget(context, state.firstDayNoti, days, (String? newValue) => context.read<ProbeSettingBloc>().add(SetValues(firstDayNoti: newValue)), themeState)
              ),
              settingSubWidget.buildRowSetting(
                icon: Icons.thermostat, 
                title: 'วันที่สองที่แจ้งเตือน', 
                trailing: dropDownWidget(context, state.secondDayNoti, days, (String? newValue) => context.read<ProbeSettingBloc>().add(SetValues(secondDayNoti: newValue)), themeState)
              ),
              settingSubWidget.buildRowSetting(
                icon: Icons.thermostat, 
                title: 'วันที่สามที่แจ้งเตือน', 
                trailing: dropDownWidget(context, state.thirdDayNoti, days, (String? newValue) => context.read<ProbeSettingBloc>().add(SetValues(thirdDayNoti: newValue)), themeState)
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
                      Text('${state.firstTime.hour.toString().padLeft(2, '0')}.${state.firstTime.minute.toString().padLeft(2, '0')} น.', style: TextStyle(color: themeState.themeApp? Colors.white : secColor, fontWeight: FontWeight.w500)),
                      Icon(Icons.arrow_drop_down, color: themeState.themeApp? Colors.white : secColor),
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
                      Text('${state.secondTime.hour.toString().padLeft(2, '0')}.${state.secondTime.minute.toString().padLeft(2, '0')} น.', style: TextStyle(color: themeState.themeApp? Colors.white : secColor, fontWeight: FontWeight.w500)),
                      Icon(Icons.arrow_drop_down, color: themeState.themeApp? Colors.white : secColor),
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
                      Text('${state.thirdTime.hour.toString().padLeft(2, '0')}.${state.thirdTime.minute.toString().padLeft(2, '0')} น.', style: TextStyle(color: themeState.themeApp? Colors.white : secColor, fontWeight: FontWeight.w500)),
                      Icon(Icons.arrow_drop_down, color: themeState.themeApp? Colors.white : secColor),
                    ],
                  ),
                ),
              ),
            ]);
          },
        );
      },
    );
  }

  // Dropdown Widget
  Widget dropDownWidget(BuildContext context, String value, List values, ValueChanged<String?>? function, ThemeState themeState) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        items: values.map((v) {
          return DropdownMenuItem<String>(
            value: v,
            child: Text(v.toString(), style: TextStyle(color: themeState.themeApp? Colors.white : secColor,fontWeight: FontWeight.w500)),
          );
        }).toList(),
        onChanged: function,
        dropdownColor: themeState.themeApp? boxColorDark : Colors.white,
        icon: Icon(Icons.arrow_drop_down_outlined,color: themeState.themeApp? Colors.white : secColor),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}