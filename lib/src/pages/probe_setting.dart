import 'package:firstapp/src/widgets/probe_setting/setting.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:firstapp/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProbeSetting extends StatelessWidget {
  const ProbeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    BarCustom tabbarBottomAppbar = BarCustom();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarBottomAppbar.appBarCustom(context, 'ตั้งค่าโพรบ', [
          TabItem(title: 'โพรบ 1'),
          TabItem(title: 'โพรบ 2'),
        ], null),
        body: TabBarView(
          children: [
            Setting(),
            Setting(),
          ],
        ),
      ),
    );
  }
}