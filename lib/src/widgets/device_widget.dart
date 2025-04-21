// Widget ของอุปกรณ์ที่แสดงในแอปพลิเคชั่น
import 'package:firstapp/src/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviceStatus extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String status;
  final double fontSize;
  const DeviceStatus({super.key, required this.bgColor, required this.textColor, required this.status, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6,right: 6,top: 4,bottom: 4), 
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)), 
      child: Text(status, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),), 
    );
  }
}

// แสดงข้อมูลรายละเอียดของอุปกรณ์หน้า DeviceDetailWidget_page.dart
class DeviceDetailWidget extends StatelessWidget {
  final Map<String, dynamic> deviceData;
  final List notifications;
  DeviceDetailWidget({super.key, this.deviceData = const {}, this.notifications = const []});

  NotificationWidget notificationWidget = NotificationWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Card(
            elevation: 3,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(deviceData['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          'รหัส: ${deviceData['id']} • ${deviceData['location']}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
          
                  // สถานะ
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: getStatusColor(deviceData['status']),
                        size: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        deviceData['status'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getStatusColor(deviceData['status']),
                        ),
                      )
                    ],
                  ),
                  Divider(height: 24),
          
                  SizedBox(height: 10),
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
              ),
            ),
          ),
          SizedBox(height: 20),

          // รายการแจ้งเตือนของอุปกรณ์นี้
          Column(
            children: [
              for(var noti in notifications)
                notificationWidget.buildNotificationWidget(noti['title'], noti['message'], noti['datetime'].split(' ')[0], noti['datetime'].split(' ')[1]),
            ],
          ),
        ],
      ),
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

  // ฟังก์ชั่นแยกสีตามสถานะของอุปกรณ์
  Color getStatusColor(String status) {
    switch (status) {
      case 'Online':
        return Colors.green;
      case 'Offline':
        return Colors.red;
      case 'Maintenance':
        return Colors.yellow.shade600;
      case 'Error':
        return Colors.orange.shade600;
      default:
        return Colors.grey;
    }
  }
}