import 'package:firstapp/src/contants.dart';
import 'package:firstapp/src/pages/home_page.dart';
import 'package:firstapp/src/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
    FocusNode passFocus = FocusNode();

    // ตัวเช็คตัวเปิดมองเห็นรหัสผ่าน
    bool isShowPass = true;

    // ------------- ฟังก์ชั่นกดแสดงรหัสผ่าน ------------
    void togglePassword() {
      isShowPass = !isShowPass;
      // เช็คถ้ายังกดอยู่กับช่องใส่รหัสผ่านจะไม่ทำอะไร
      if(passFocus.hasPrimaryFocus) return;
      // ป้องกันการกดปุ่มก่อนเวลา
      passFocus.canRequestFocus = false;
      print(isShowPass);
      print('$username $password');
    }

    //double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network('https://www.getautismactive.com/wp-content/uploads/2021/01/Test-Logo-Circle-black-transparent.png', height: 200, width: 200,)),
                const SizedBox(height: 10,),
                Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600, color: secColor),),
                const SizedBox(height: 20,),
                Text('กรุณาเข้าสู่ระบบเพื่อดำเนินการต่อ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal, color: secColor),),
                const SizedBox(height: 60,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'บัญชีผู้ใช้',
                    //errorText: errTxt,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: primaryColor.withOpacity(0.5),
                      ),
                    )
                  ),
                  controller: usernameController,
                  onSaved: (value) {
                    username = value!;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'รหัสผ่าน',
                    //errorText: errTxt,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    suffixIcon: GestureDetector(
                      onTap: togglePassword, 
                      child: isShowPass? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: primaryColor.withOpacity(0.5),
                      ),
                    )
                  ),
                  obscureText: isShowPass,
                  controller: passwordController,
                  focusNode: passFocus,
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 10,),

                // ปุ่มลืมรหัสผ่าน
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [Text('ลืมรหัสผ่าน', style: TextStyle(color: secColor, fontSize: 13, fontWeight: FontWeight.w500),)],),
                const SizedBox(height: 100,),

                // ปุ่มเข้าสู่ระบบ
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: threeColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color:  Color.fromRGBO(181, 181, 181, 0.5),
                            blurRadius: 4,
                            offset: Offset(4, 8), // Shadow position
                          ),
                        ],
                      ),
                      child: Center(child: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),),
                    ),
                  ),
                ],),

                const SizedBox(height: 80,),
                // ตัวหนังสือสร้างบัญชี
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('ยังไม่มีบัญชี?', style: TextStyle(color: secColor),),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())), 
                    child: const Text(' สร้างบัญชี',style: TextStyle(color: Colors.orange),)
                  ),
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}