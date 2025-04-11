import 'package:flutter/material.dart';

class Systemwidgetcustom {
  // UI โหลดข้อมูล
  Future loadingWidget(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3), // พื้นหลังโปร่งใส
      builder: (context) {
        return Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20),
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 6.0,
            ),
          ),
        );
      },
    );
  }
}
