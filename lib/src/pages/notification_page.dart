import 'package:firstapp/src/pages/notification_settings_page.dart';
import 'package:firstapp/src/widgets/notification/etemp.dart';
import 'package:firstapp/src/widgets/notification/line_noti.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:firstapp/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BarCustom tabbarBottomAppbar = BarCustom();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarBottomAppbar.appBarCustom(context, 'แจ้งเตือน', [
          TabItem(title: 'eTEMP/iTemS'),
          TabItem(title: 'Line Notify'),
        ], [IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage())), icon: Icon(Icons.settings, color: Colors.white, size: 30,)), const SizedBox(width: 20,)]),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Etemp(),
            ),
            SingleChildScrollView(
              child: LineNoti(),
            ),
          ],
        ),
      ),
    );
  }
}