// Widget ของอุปกรณ์ที่แสดงในแอปพลิเคชั่น
import 'package:flutter/material.dart';

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