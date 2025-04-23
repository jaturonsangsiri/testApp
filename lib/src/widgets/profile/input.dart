import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();
  // ชื่อผู้ใช้
  String username = 'Jaturon Sangsiri';
  // ---------- Controllers ----------
  TextEditingController nameController = TextEditingController();
  TextEditingController oldPasswrodController = TextEditingController();
  TextEditingController newPasswrodController = TextEditingController();
  TextEditingController confirmPasswrodController = TextEditingController();
  // ---------- Focus Nodes เอาไว้จัดการการโฟกัส ----------
  FocusNode nameFocusNode = FocusNode();
  FocusNode newPasswrodFocusNode = FocusNode();
  FocusNode oldPasswrodFocusNode = FocusNode();
  FocusNode confirmPasswrodNode = FocusNode();
  // ---------- Global Key ----------
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // // ฟังก์ชั่นสุ่มตำแหน่งวงกลมสีน้ำเงินในแถบด้านบน
  // void getPo(double w) {
  //   positionedList = [];
  //   for (int i = 0; i < 5; i++)
  //   {
  //     double top = Random().nextInt(90).toDouble();  // จำกัดไว้ไม่เกิน 120 px
  //     double left = Random().nextInt((w - 60).toInt()).toDouble(); // ขอบซ้าย 
  //     double width = 40 + Random().nextInt(20).toDouble();
  //     double height = 40 + Random().nextInt(20).toDouble();
  //     positionedList.add([top, left, width, height]);
  //     print("จุดที่ ${i+1}: $top, $left, $width, $height");
  //   }
  // }

  // ฟังก์ชั่น unfocus
  void unfocus() {
    nameFocusNode.unfocus();
    oldPasswrodFocusNode.unfocus();
    newPasswrodFocusNode.unfocus();
    confirmPasswrodNode.unfocus();
  }

//  @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       double w = MediaQuery.of(context).size.width;
//       //getPo(w);
//       setState(() {});
//     });
//   }

  // ปิดตัวคอนโทลเลอร์และโฟกัสโนดเมื่อไม่ใช้งาน
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    oldPasswrodController.dispose();
    newPasswrodController.dispose();
    confirmPasswrodController.dispose();
    nameFocusNode.dispose();
    newPasswrodFocusNode.dispose();
    oldPasswrodFocusNode.dispose();
    confirmPasswrodNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text('ชื่อผู้ใช้', style: TextStyle(fontSize: Responsive.isTablet ? 20 : 18, fontWeight: FontWeight.bold),),
          systemwidgetcustom.normalTextFormField(hintText: 'ชื่อผู้ใช้', controller: nameController, keyboardType: TextInputType.text, valueSave: username, focus: nameFocusNode),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: secColor), child: const Text('บันทึก',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),),
          const SizedBox(height: 25,),
          Text('รหัสผ่านเก่า', style: TextStyle(fontSize: Responsive.isTablet ? 20 : 18, fontWeight: FontWeight.bold),),
          systemwidgetcustom.normalTextFormField(hintText: 'รหัสผ่านเก่า', controller: oldPasswrodController, keyboardType: TextInputType.text, valueSave: '', focus: oldPasswrodFocusNode),
          const SizedBox(height: 10,),
          Text('รหัสผ่านใหม่', style: TextStyle(fontSize: Responsive.isTablet ? 20 : 18, fontWeight: FontWeight.bold),),
          systemwidgetcustom.normalTextFormField(hintText: 'รหัสผ่านใหม่', controller: newPasswrodController, keyboardType: TextInputType.text, valueSave: '', focus: newPasswrodFocusNode),
          const SizedBox(height: 10,),
          Text('ยืนยันรหัสผ่านใหม่', style: TextStyle(fontSize: Responsive.isTablet ? 20 : 18, fontWeight: FontWeight.bold),),
          systemwidgetcustom.normalTextFormField(hintText: 'ยืนยันรหัสผ่านใหม่', controller: confirmPasswrodController, keyboardType: TextInputType.text, valueSave: '', focus: confirmPasswrodNode),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: secColor), child: const Text('บันทึก',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),),
        ],
      ),
    );
  }
}