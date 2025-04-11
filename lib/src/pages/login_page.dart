import 'package:firstapp/src/bloc/layout_bloc.dart';
import 'package:firstapp/src/bloc/layout_event.dart';
import 'package:firstapp/src/bloc/layout_state.dart';
import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/home_page.dart';
import 'package:firstapp/src/pages/register_page.dart';
import 'package:firstapp/src/widgets/systemWidgetCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  // จดจำบัญชีหรือไหม
  bool isRemember = false;
  double fontSize = 16.0;

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
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    // ปรับ UI จอให้เหมาะสมกับขนาดจอ
    context.read<LayoutBloc>().add(CheckLayoutEvent(width));

    return Scaffold(
      body: BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, state) {
          state is TabletLayoutState? fontSize = 16 :  fontSize = 14;
          return SafeArea(
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      // พื้นหลัง Gradient
                      Positioned(
                        top: 0,
                        child: Container(
                          height: height * 0.40,
                          width: width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [secColor, fiveColor],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 70, left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'เข้าสู่ระบบ',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'กรุณาเข้าสู่ระบบเพื่อดำเนินการต่อ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // กล่องฟอร์ม (เข้าสู่ระบบหรือสมัครบัญชี)
                      Align(
                        alignment: Alignment.center, 
                        child: Container(
                          padding: EdgeInsets.all(25),
                          height: 350,
                          width: width * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(181, 181, 181, 0.5),
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(181, 181, 181, 0.5),
                                blurRadius: 2,
                                offset: Offset(-4, 8), // Shadow position
                              ),
                            ],
                          ),
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
                              const SizedBox(height: 10),
                        
                              // ปุ่มลืมรหัสผ่านและจดจำบัญชี
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isRemember,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isRemember = value!;
                                          });
                                        },
                                        activeColor: threeColor,
                                        side: BorderSide(
                                          color: fourColor,
                                        ),
                                      ),
                                      Text(
                                        'จดจำบัญชี',
                                        style: TextStyle(color: secColor, fontSize: 14, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'ลืมรหัสผ่าน',
                                    style: TextStyle(color: sixColor, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
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
                        ),
                      ),

                      // ปุ่มสร้างบัญชี
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: width,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ยังไม่มีบัญชี?', style: TextStyle(color: secColor)),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => RegisterPage())),
                                    child: Text(
                                      ' สร้างบัญชี',
                                      style: TextStyle(color: sixColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}