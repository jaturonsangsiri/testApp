import 'package:firstapp/src/app.dart';
import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class BarCustom {
  PreferredSize tabbarBottomApp(List<TabItem> tabs) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40), 
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: Colors.green.shade100),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: threeColor,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: const Color.fromARGB(255, 94, 94, 94),
          tabs: tabs
        ),
      ),
    );
  }

  AppBar appBarCustom(BuildContext context, String title, List<TabItem> tabs, List<Widget>? actions) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white,),),
      actions: actions,
      title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
      backgroundColor: secColor,
      bottom: tabbarBottomApp(tabs),
    );
  }
}