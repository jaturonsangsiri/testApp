import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/home_page.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _InputFormState();
}

class _InputFormState extends State<LoginForm> {
  // ---------- ประกาศตัวแปร ----------
  // key ของตัวกรอกผู้ใช้และรหัสผ่าน
  final _formKey = GlobalKey<FormState>();
  
  // controllers form
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ชื่อผู้ใช้
  String username = '';
  // รหัสผ่าน
  String password = '';
  // user pass focus node
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  // ตัวเช็คตัวเปิดมองเห็นรหัสผ่าน
  bool isShowPass = true;
  // Widget System Custom
  final Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  // ------------- ฟังก์ชั่นกดแสดงรหัสผ่าน ------------
  void togglePassword() {
    setState(() {
      isShowPass = !isShowPass;
      // เช็คถ้ายังกดอยู่กับช่องใส่รหัสผ่านจะไม่ทำอะไร
      if (passFocus.hasPrimaryFocus) return;
      // ป้องกันการกดปุ่มก่อนเวลา
      passFocus.canRequestFocus = false;
    });
  }

  // ------------- ฟังก์ชั่นกดปุ่มเข้าสู๋ระบบ ------------
  void login() async {
    systemwidgetcustom.loadingWidget(context);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // เช็คชื่อผู้ใช้และรหัสผ่าน
      if (username == 'admin' && password == '1234') {
        // ยกเลิก focus ช่องกรอกข้อมูล
        _unfocus();

        // แสดงข้อมความยินดีต้อนรับหลังจากดีเลย์ 2 วินาที
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ยินดีต้อนรับคุณ $username'), duration: const Duration(seconds: 2),));
          // ปิดโหลดดิ้ง
          Navigator.pop(context);

          // รีเซ็ตค่า username และ password
          usernameController.clear();
          passwordController.clear();
          username = '';
          password = '';

          // ถ้าชื่อผู้ใช้และรหัสผ่านถูกต้องให้ไปที่หน้า HomePage
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      } else {
        // ปิดโหลดดิ้ง
        Navigator.pop(context);
        // ยกเลิก focus ช่องกรอกข้อมูล
        _unfocus();

        // ถ้าชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้องให้แสดงข้อความผิดพลาด
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง')));
      }
    }
  }

  // ------------- ยกเลิก focus ช่องกรอกข้อมูล -------------
  void _unfocus() {
    userFocus.unfocus();
    passFocus.unfocus();
  }

  // ------------- ฟังก์ชั่นเคลียร์คอนโทรเลอร์ -------------
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'บัญชีผู้ใช้',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: sixColor.withOpacity(0.5),
                ),
              ),
            ),
            controller: usernameController,
            focusNode: userFocus,
            onSaved: (value) {
              username = value!;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'รหัสผ่าน',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: GestureDetector(
                onTap: togglePassword,
                child: isShowPass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: sixColor.withOpacity(0.5),
                ),
              ),
            ),
            obscureText: isShowPass,
            controller: passwordController,
            focusNode: passFocus,
            onSaved: (value) {
              password = value!;
            },
          ),
          const SizedBox(height: 30),
                      
          // ปุ่มเข้าสู่ระบบ
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: login,
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: secColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(181, 181, 181, 0.5),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}