import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TempInfo extends StatefulWidget {
  const TempInfo({super.key});

  @override
  State<TempInfo> createState() => _TempInfoState();
}

class _TempInfoState extends State<TempInfo> {
  final Map<String, dynamic> deviceData = {
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
  };

  @override
  Widget build(BuildContext context) {
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
            _buildRangeColumn('ช่วงอุณหภูมิ', '${deviceData['lowest_temp']}°C - ${deviceData['highest_temp']}°C'),
            _buildRangeColumn('ช่วงความชื้น', '${deviceData['lowest_humi']}% - ${deviceData['highest_humi']}%'),
          ],
        ),
      ],
    );
  }

  // Widget สำหรับแสดงช่วงค่าที่รองรับ
  Widget _buildRangeColumn(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 18, color: Colors.grey[700])),
      ],
    );
  }

  // Widget สำหรับสดงข้อมูลอุณหภูมิและความชื้นของอุปกรณ์
  Widget _buildSensorReading({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 50),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Text(
          value,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}