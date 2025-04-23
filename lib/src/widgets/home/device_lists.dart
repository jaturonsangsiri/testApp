import 'package:firstapp/src/bloc/home/home_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/pages/device_detail_page.dart';
import 'package:firstapp/src/widgets/device_widget.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceLists extends StatelessWidget {
  const DeviceLists({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceDetailWidget deviceDetail = DeviceDetailWidget();
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.devices.isEmpty? Center(child: Text('ไม่มีข้อมูล',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: fourColor),)) : ListView.builder(
            padding: EdgeInsets.only(top: 0,bottom: 0),
            itemCount: state.devices.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DevicedetailPage())),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //elevation: 8,
                  color: Colors.white,
                  shadowColor: Color.fromRGBO(181, 181, 181, 0.5),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(0),
                      width: Responsive.isTablet? 80 : 70,
                      height: Responsive.isTablet? 110 : 100,
                      decoration: BoxDecoration(
                        color: fourColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(''),
                    ),
                    title: Text(state.devices[i]['name'], style: TextStyle(fontSize: Responsive.isTablet? 18 : 14, fontWeight: FontWeight.w700),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${state.devices[i]['id']}', style: TextStyle(fontSize: Responsive.isTablet? 18 : 14),),
                        Text('-', style: TextStyle(fontSize: Responsive.isTablet? 18 : 14),),  
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconText(icon: Icons.percent, text: '25', color: Colors.black, size: Responsive.isTablet? 17 : 15, fontSize: Responsive.isTablet? 16 : 13,),
                            IconText(icon: Icons.person, text: '1', color: Colors.black, size: Responsive.isTablet? 17 : 15, fontSize: Responsive.isTablet? 16 : 13,),
                            IconText(icon: Icons.celebration, text: '10', color: Colors.black, size: Responsive.isTablet? 17 : 15, fontSize: Responsive.isTablet? 16 : 13,),
                            IconText(icon: Icons.access_alarm, text: '2', color: Colors.black, size: Responsive.isTablet? 17 : 15, fontSize: Responsive.isTablet? 16 : 13,),
                            DeviceStatus(bgColor: deviceDetail.getStatusColor(state.devices[i]['status']), textColor: Colors.white, status: state.devices[i]['status'], fontSize: Responsive.isTablet? 15 : 12)                                     
                          ],  
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      )
    );
  }
}