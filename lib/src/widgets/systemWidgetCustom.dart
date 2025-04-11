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

  // แสดง Dialog ถามผู้ใช้มีตอบ ใช่หรือไม่
  Future showDialogConfirm(
      BuildContext context,
      String title,
      String? content,
      Function onConfirm,
      Color buttonColor,
      Color bnColortwo
    ) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // ไม่ให้ปิด Dialog โดยการคลิกนอก Dialog
      builder: (context) {
        return Center(
          child: Container(
            height: 230,
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 170, 168, 168)),),
                const SizedBox(height: 30,),
                Text(content!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: buttonColor),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // ปิด Dialog
                      },
                      child: Text('ยกเลิก', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: buttonColor),),
                    ),
                    const SizedBox(width: 20,),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(bnColortwo),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: bnColortwo, width: 1),
                          ),
                        ),
                      ),
                      onPressed: () {
                        onConfirm(); // เรียกฟังก์ชันที่ส่งเข้ามา
                        Navigator.of(context).pop(); // ปิด Dialog
                      },
                      child: Text('ตกลง', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ปุ่มสีพื้นหลังเต็มทั้งปุ่ม
  Widget fullButon(Color bgColor, Color textColor, String text) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),),
    );
  }
}
