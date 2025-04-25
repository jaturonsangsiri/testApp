import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firstapp/src/bloc/user/users_bloc.dart';
import 'package:firstapp/src/services/preference.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:firstapp/src/widgets/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firstapp/src/configs/route.dart' as custom_route;

class TitleName extends StatefulWidget {
  const TitleName({super.key});

  @override
  State<TitleName> createState() => _TitleNameState();
}

class _TitleNameState extends State<TitleName> {
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();
  final configStorage = ConfigStorage();

  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(SetUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, snapshot) {
        if (snapshot.error) {
          ShowSnackbar.snackbar(ContentType.success, "เกิดข้อผิดพลาดในการเชื่อมต่อ", "กรุณาล๊อคอินใหม่อีกครั้ง");
          configStorage.clearTokens();
          custom_route.Route.navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
        }
        if (snapshot.username != "") {
          if (snapshot.role == "USER" || snapshot.role == "GUEST") {
            //context.read<DevicesBloc>().add(GetDevices(snapshot.ward));
            //context.read<DevicesBloc>().add(SetHospitalData(snapshot.hospitalId, snapshot.ward, snapshot.type));
          }
          if (snapshot.role == "LEGACY_USER") {
            //context.read<DevicesBloc>().add(GetLegacyDevices(snapshot.ward));
            //context.read<DevicesBloc>().add(SetHospitalData(snapshot.hospitalId, snapshot.ward, snapshot.type));
          }
          //print("รูปปปปปปปปปปปปปปปปปปปปปปปปป : ${snapshot.pic}");

          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(right: 8, left: 8), // Border width
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: systemwidgetcustom.circleImageButton(snapshot.pic, 18, 50, () {},10),
              ),
              SizedBox(
                width: Responsive.width * 0.5,
                child: Text(
                  snapshot.username,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: Responsive.isTablet ? 28 : 22,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        } else {
          return Text('ไม่มีข้อมูล');
        }
      },
    );
  }
}
