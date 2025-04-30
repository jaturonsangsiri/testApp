import 'package:firstapp/src/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TempInfo extends StatelessWidget {
  const TempInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> deviceData = {'name': 'เครื่องช่วยหายใจ','id': 'A1001','status': 'Online','location': 'ห้องฉุกเฉิน 101','temperature': 5.5,'humidity': 72.1,'lowest_temp': 2,'highest_temp': 38,'lowest_humi': 0,'highest_humi': 100};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // อุณหภูมิ / ความชื้น
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSensorReading(
              icon: FontAwesomeIcons.temperatureHalf,
              label: 'อุณหภูมิ',
              value: '${deviceData['temperature']}°C',
              color: Colors.orange,
            ),
            _buildSensorReading(
              icon: FontAwesomeIcons.droplet,
              label: 'ความชื้น',
              value: '${deviceData['humidity']}%',
              color: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 30),
        // ช่วงค่าที่รองรับ
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRangeColumn(
              'ช่วงอุณหภูมิ',
              '${deviceData['lowest_temp']}°C - ${deviceData['highest_temp']}°C',
            ),
            _buildRangeColumn(
              'ช่วงความชื้น',
              '${deviceData['lowest_humi']}% - ${deviceData['highest_humi']}%',
            ),
          ],
        ),
      ],
    );
  }

  // Widget สำหรับแสดงช่วงค่าที่รองรับ
  Widget _buildRangeColumn(String title, String value) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Column(
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: themeState.themeApp? Colors.white : Colors.black)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 18, color: themeState.themeApp? Colors.white70 : Colors.grey[700])),
          ],
        );
      },
    );
  }

  // Widget สำหรับสดงข้อมูลอุณหภูมิและความชื้นของอุปกรณ์
  Widget _buildSensorReading({required IconData icon, required String label, required String value, required Color color}) {
    return Column(
      children: [
        Icon(icon, color: color, size: 50),
        SizedBox(height: 4),
        BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) => Text(label, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: themeState.themeApp? Colors.white : Colors.black))),
        Text(value, style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: color)),
      ],
    );
  }
}
