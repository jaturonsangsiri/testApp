import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
  // จุดที่อยู่ของวงกลมสีน้ำเงินในแถบด้นบน
  List<List<double>> positionedList = [
    [15.0, 262.0, 49.0, 52.0],
    //[47.0, 176.0, 58.0, 50.0],
    //[21.0, 59.0, 59.0, 52.0],
    [65.0, 29.0, 55.0, 54.0],
    [70.0, 327.0, 43.0, 53.0],
  ];
  double width = 0.0, fontSize = 0.0;

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
    final double width = MediaQuery.of(context).size.width;
    final double fontSize = width > 700 ? 20.0 : 15.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขโปรไฟล์', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
        centerTitle: true,  
        backgroundColor: secColor,
      ),
      body: Column(
        children: [
          Container(
            color: secColor,
            width: width,
            height: 200,
            child: Stack(
              clipBehavior: Clip.none, // สำคัญ! ปรับเพื่อให้รูปโปรไฟล์ล้นออกมาได้
              children: [
                // กล่องสีขาวอยู่ด้านล่างสุดของ Stack
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(100),
                      ),
                    ),
                    width: width,
                    height: 80,
                  ),
                ),
      
                // Randomized green circles
                // สุ่มตำแหน่งวงกลม
                for (var posi in positionedList)
                  Positioned(
                    top: posi[0],  
                    left: posi[1],
                    child: Container(
                      width: posi[2],
                      height: posi[3],
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(125, 170, 242, 1).withOpacity(0.5),
                      ),
                    ),
                  ),
      
      
                // รูปโปรไฟล์แบบลอยทับกล่องสีขาว
                Align(  
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Stack(
                      children: [
                        // รูปโปรไฟล์
                        systemwidgetcustom.circleImageButton("assets/images/app-logo.png",80,130,() {},),
                        // ไอคอนกล้อง
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleIconNoNumber(
                            icon: const Icon(Icons.camera_alt, color: Colors.white, size: 25),
                            colorbg: primaryColor,
                            padding: 1,
                            function: () {
                              //unfocus();
                              //showDialog(context: context, builder: (context) => AlertDialog(title: Text('เปิดกล้อง'),content: Text('กำลังเปิดกล้อง'),actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('ยกเลิก',style: TextStyle(color: Colors.red),)),TextButton(onPressed: ()=>Navigator.pop(context), child: Text('ตกลง',style: TextStyle(color: secColor),))],));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),  
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Text('ชื่อผู้ใช้', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                systemwidgetcustom.normalTextFormField(hintText: 'ชื่อผู้ใช้', controller: nameController, keyboardType: TextInputType.text, valueSave: username, focus: nameFocusNode),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: secColor), child: const Text('บันทึก',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),),
                const SizedBox(height: 25,),
                Text('รหัสผ่านเก่า', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                systemwidgetcustom.normalTextFormField(hintText: 'รหัสผ่านเก่า', controller: oldPasswrodController, keyboardType: TextInputType.text, valueSave: '', focus: oldPasswrodFocusNode),
                const SizedBox(height: 10,),
                Text('รหัสผ่านใหม่', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                systemwidgetcustom.normalTextFormField(hintText: 'รหัสผ่านใหม่', controller: newPasswrodController, keyboardType: TextInputType.text, valueSave: '', focus: newPasswrodFocusNode),
                const SizedBox(height: 10,),
                Text('ยืนยันรหัสผ่านใหม่', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                systemwidgetcustom.normalTextFormField(hintText: 'ยืนยันรหัสผ่านใหม่', controller: confirmPasswrodController, keyboardType: TextInputType.text, valueSave: '', focus: confirmPasswrodNode),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: secColor), child: const Text('บันทึก',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}