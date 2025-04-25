import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/profile/change_profile.dart';
import 'package:firstapp/src/widgets/profile/input.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // จุดที่อยู่ของวงกลมสีน้ำเงินในแถบด้นบน
    List<List<double>> positionedList = [[15.0, 262.0, 49.0, 52.0], [65.0, 29.0, 55.0, 54.0], [70.0, 327.0, 43.0, 53.0]];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: secColor,
              width: Responsive.width,
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
                      width: Responsive.width,
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
                          color: Color.fromRGBO(125, 170, 242, 1),
                        ),
                      ),
                    ),
        
        
                  // รูปโปรไฟล์แบบลอยทับกล่องสีขาว
                  ChangeProfile(),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(15),
              child: ProfileForm(),
            ),
          ],
        ),
      ),
    );
  }
}