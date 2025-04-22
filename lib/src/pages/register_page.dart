import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // ---------- ประกาศตัวแปร ----------
  // key ของตัวกรอกข้อมูล
  final _formKey = GlobalKey<FormState>();

  // controllers form
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conFirmPasswordController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  // ชื่อผู้ใช้
  String name = '';
  // รหัสผ่าน
  String password = '';
  // ยืนยันรหัสผ่าน
  String conFirmPassword = '';
  // ชื่อบัญชี
  String accountName = '';
  // focus node
  FocusNode nameFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode conFocus = FocusNode();
  FocusNode accNameFocus = FocusNode();
  // custom widget
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  // เช็คว่าเป็นแท็บเล็ตหรือไม่
  bool isTablet = false;

  // ---------- ฟังก์ชั่นจำลองสมัครบัญชี ----------
  void register() async {
    systemwidgetcustom.loadingWidget(context);
    if (_formKey.currentState!.validate()) {
      // บันทึกข้อมูลลงตัวแปร
      name = nameController.text;
      password = passwordController.text;
      conFirmPassword = conFirmPasswordController.text;
      accountName = accountNameController.text;

      _unfocus();
      await Future.delayed(const Duration(seconds: 1));
      // 
      // เช็ครหัสผ่านกับยืนยันรหัสผ่าน
      if ((password == conFirmPassword) && password.isNotEmpty && conFirmPassword.isNotEmpty) {
        // แสดงข้อมูลที่บันทึก
        print("สมัครบัญชี ชื่อ: $name \nรหัสผ่าน: $password\nชื่อบัญชี: $accountName");

        await Future.delayed(const Duration(seconds: 2)).then((value) {
          // ปิดการโหลดข้อมูล
          Navigator.pop(context);

          // แสดงข้อความสมัครบัญชีสำเร็จ
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('สมัครบัญชีสำเร็จ'),
                content: const Text('คุณได้สมัครบัญชีเรียบร้อยแล้ว'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('ตกลง'),
                  ),
                ],
              );
            },
          );
        });
      } else {
        // ปิดการโหลดข้อมูล
        Navigator.pop(context);
        // แสดงข้อความรหัสผ่านไม่ตรงกัน
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('รหัสผ่านไม่ตรงกัน'),
              content: const Text('กรุณากรอกรหัสผ่านให้ตรงกัน'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('ตกลง'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  // ---------- ฟังก์ชั่น unfocus ----------
  void _unfocus() {
    nameFocus.unfocus();
    passFocus.unfocus();
    accNameFocus.unfocus();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    conFirmPasswordController.dispose();
    accountNameController.dispose();
    nameFocus.dispose();
    passFocus.dispose();
    accNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ขนาดหน้าจอ
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    isTablet = width > 600 ? true : false;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
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
                        'สมัรบัญชีของท่าน',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'กรุณาสมัครบัญชีของท่านเพื่อใช้บริการภายใแอป',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // กล่องกรอกข้อมูลสมัครบัญชี
            Align(
              alignment: Alignment.center, 
              child: Container(
                padding: EdgeInsets.all(25),
                height: 410,
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
                    const SizedBox(height: 20,),
                    systemwidgetcustom.normalTextFormField(controller: nameController,hintText: 'ชื่อผู้ใช้',keyboardType: TextInputType.name,valueSave: name, focus: nameFocus),
                    const SizedBox(height: 10,),
                    systemwidgetcustom.normalTextFormField(controller: passwordController,hintText: 'รหัสผ่าน',keyboardType: TextInputType.visiblePassword,valueSave: password, focus: passFocus),
                    const SizedBox(height: 10,),
                    systemwidgetcustom.normalTextFormField(hintText: 'ยืนยันรหัสผ่าน', controller: conFirmPasswordController, keyboardType: TextInputType.visiblePassword, valueSave: conFirmPassword, focus: conFocus),
                    const SizedBox(height: 10,),
                    systemwidgetcustom.normalTextFormField(controller: accountNameController,hintText: 'ชื่อที่แสดง',keyboardType: TextInputType.name,valueSave: accountName, focus: accNameFocus),
                    const SizedBox(height: 30,),
      
                    // ปุ่มสมัครบัญชี
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        GestureDetector(
                          onTap: register,
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
                                'สมัครบัญชี',
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
      
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 80),
                width: width,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('มีบัญชีอยู่แล้ว?', style: TextStyle(color: secColor)),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            ' เข้าสู่ระบบ',
                            style: TextStyle(color: sixColor, fontSize: isTablet? 16: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Version: 1.1.0',
                      style: TextStyle(color: secColor, fontSize: isTablet? 16: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}