import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                actions: [TextButton(
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          systemwidgetcustom.normalTextFormField(controller: nameController,hintText: 'ชื่อผู้ใช้',keyboardType: TextInputType.name,valueSave: name, focus: nameFocus, hintColor: Colors.black),
          const SizedBox(height: 10,),
          systemwidgetcustom.normalTextFormField(controller: passwordController,hintText: 'รหัสผ่าน',keyboardType: TextInputType.visiblePassword,valueSave: password, focus: passFocus, hintColor: Colors.black),
          const SizedBox(height: 10,),
          systemwidgetcustom.normalTextFormField(hintText: 'ยืนยันรหัสผ่าน', controller: conFirmPasswordController, keyboardType: TextInputType.visiblePassword, valueSave: conFirmPassword, focus: conFocus, hintColor: Colors.black),
          const SizedBox(height: 10,),
          systemwidgetcustom.normalTextFormField(controller: accountNameController,hintText: 'ชื่อที่แสดง',keyboardType: TextInputType.name,valueSave: accountName, focus: accNameFocus, hintColor: Colors.black),
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
                    boxShadow: [BoxShadow(color: Color.fromRGBO(181, 181, 181, 0.5), blurRadius: 4, offset: Offset(4, 8))],
                  ),
                  child: Center(child: Text('สมัครบัญชี', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}