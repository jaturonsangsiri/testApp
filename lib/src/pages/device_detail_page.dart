import 'package:firstapp/src/pages/probe_setting.dart';
import 'package:firstapp/src/widgets/device_widget.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:firstapp/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

class DevicedetailPage extends StatelessWidget {
  const DevicedetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    BarCustom tabbarBottomAppbar = BarCustom();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarBottomAppbar.appBarCustom(context, 'รายละเอียด', [
          TabItem(title: 'โพรบ 1'),
          TabItem(title: 'โพรบ 2'),
        ], [IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProbeSetting())), icon: Icon(Icons.settings, color: Colors.white, size: 30,)), const SizedBox(width: 20,)]),
        body: TabBarView(
          children: [
            DeviceDetailWidget(),
            DeviceDetailWidget(),
          ],
        ),
      ),
    );
  }
}