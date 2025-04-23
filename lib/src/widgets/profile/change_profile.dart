import 'package:firstapp/src/bloc/user/users_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, snapshot) {
        return Align(  
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Stack(
              children: [
                // รูปโปรไฟล์
                systemwidgetcustom.circleImageButton(snapshot.pic,60,100,() {},60),
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
        );
      },
    );
  }
}