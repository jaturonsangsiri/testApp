import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class TabbarBottomAppbar {
  PreferredSize tabbarBottomApp(List<TabItem> tabs) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40), 
      child: Container(
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.green.shade100),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: threeColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: const Color.fromARGB(255, 94, 94, 94),
          tabs: tabs
        ),
      ),
    );
  }
}