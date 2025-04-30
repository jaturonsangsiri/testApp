import 'package:firstapp/src/bloc/device/devices_bloc.dart';
import 'package:firstapp/src/bloc/theme/theme_bloc.dart';
import 'package:firstapp/src/bloc/user/users_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/home/device_legacy.dart';
import 'package:firstapp/src/widgets/home/device_lists.dart';
import 'package:firstapp/src/widgets/home/select_dropdown.dart';
import 'package:firstapp/src/widgets/options_menubar.dart';
import 'package:firstapp/src/widgets/title.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, user) {
        if(user.role == "USER" || user.role == "LEGACY_USER" || user.role == "GUEST") {
          context.read<DevicesBloc>().add(SetHospitalData(user.hospitalId, user.ward, user.type));
          context.read<DevicesBloc>().add(GetDevices(user.ward));
        }

        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // แสดงหัวข้อชื่อผู้ใช้ รูปโปรไฟล์ และเมนูแจ้งเตือนและตั้งค่า
                  Container(
                    width: Responsive.width,
                    height: Responsive.height * 0.15,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), color: themeState.themeApp? Color(0xFF2C2C2E).withValues(alpha: 0.7) : secColor),
                    child: Stack(
                      children: [
                        // Randomized green circles
                        // สุ่มตำแหน่งวงกลมสีเขียว
                        for (int i = 0; i < 5; i++)
                          Positioned(
                            top: Responsive.height * (0.05 + 0.15 * (i / 5)) + (Responsive.height * 0.1 * (i % 2 == 0 ? 1 : -1)),
                            left: Responsive.width * (0.1 + 0.2 * (i / 5)) + (Responsive.width * 0.1 * (i % 2 == 0 ? -1 : 1)),
                            child: Container(
                              width: (40 + (10 * i)).toDouble(),
                              height: (40 + (10 * i)).toDouble(),
                              decoration: BoxDecoration(shape: BoxShape.circle,color: themeState.themeApp? sixColor.withValues(alpha: 0.8) : Color.fromRGBO(125, 170, 242, 1)),
                              child: Text(''),
                            ),
                          ),

                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [ TitleName(), OptionsMenubar(), const SizedBox(width: 5)],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ตัวเลือกโรงพยาบาลและวอด
                  if(user.role == "SERVICE" || user.role == "ADMIN" || user.role == "LEGACY_ADMIN" || user.role == "SUPER")
                    SelectDropdown(), 
              
                  const SizedBox(height: 10),

                  // แสดงข้อมูลรายการอุปกรณ์ที่มีทั้งหมด
                  BlocBuilder<DevicesBloc, DevicesState>(
                    builder: (context, state) {
                      return state.wardType == ""? user.type == "LEGACY"? const LegacyLists() : const DeviceLists() : state.wardType == "LEGACY"? const LegacyLists() : const DeviceLists();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
