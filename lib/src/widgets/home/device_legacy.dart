import 'dart:async';

import 'package:firstapp/src/bloc/device/devices_bloc.dart';
import 'package:firstapp/src/bloc/theme/theme_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/pages/device_detail_page.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LegacyLists extends StatefulWidget {
  const LegacyLists({super.key});

  @override
  State<LegacyLists> createState() => _LegacyListsState();
}

class _LegacyListsState extends State<LegacyLists> {
  Timer? _timer;
  late String ward;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      context.read<DevicesBloc>().add(GetDevices(ward));
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<DevicesBloc, DevicesState>(
            builder: (context, device) {
              ward = device.wardId;
              return device.legacyDevice.isEmpty? Center(child: Text('ไม่มีข้อมูล',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: fourColor),)) : ListView.builder(
                padding: EdgeInsets.only(top: 0,bottom: 0),
                itemCount: device.legacyDevice.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DevicedetailPage())),
                    child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      //elevation: 8,
                      color: themeState.themeApp? fourColor : Colors.white,
                      shadowColor: Color.fromRGBO(181, 181, 181, 0.5),
                      child: ListTile(
                        trailing: Text(device.legacyDevice[i].log!.length.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black),),
                        title: Text(device.legacyDevice[i].name!, style: TextStyle(fontSize: Responsive.isTablet? 18 : 14, fontWeight: FontWeight.w700),),
                        subtitle: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const SizedBox(width: 2),
                            Text(device.legacyDevice[i].sn!, style: TextStyle(fontSize: Responsive.isTablet ? 20 : 14)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      )
    );
  }
}