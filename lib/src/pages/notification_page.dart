import 'package:firstapp/src/bloc/user/users_bloc.dart';
import 'package:firstapp/src/models/models.dart';
import 'package:firstapp/src/pages/notification_settings_page.dart';
import 'package:firstapp/src/widgets/notification/notification.dart';
import 'package:firstapp/src/widgets/notification/notification_legacy.dart';
import 'package:firstapp/src/widgets/tab_item.dart';
import 'package:firstapp/src/widgets/appbar.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int tabLength = 1;
  late final TextStyle tabTextStyle;
  final List<TabItem> tab = [];
  final List<Widget> tabView = [];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (Responsive.isTablet) {
      tabTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    } else {
      tabTextStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
    }

    _tabController = TabController(length: tabLength, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    BarCustom tabbarBottomAppbar = BarCustom();
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, userState) {
        switch (userState.role) {
          case "USER":
            tab.addAll([const TabItem(title: 'eTEMP/iTemS')]);
            tabView.addAll([const SizedBox(child: NotificationList())]);
            break;
          case "LEGACY_USER":
            tab.addAll([const TabItem(title: 'Line Notify')]);
            tabView.addAll([const SizedBox(child: NotificationLegacy())]);
            break;
          case "GUEST":
            tab.addAll([const TabItem(title: 'eTEMP/iTemS')]);
            tabView.addAll([const SizedBox(child: NotificationList())]);
            break;
          case "SUPER":
            tab.addAll([
              const TabItem(title: 'eTEMP/iTemS'),
              const TabItem(title: 'Line Notify'),
            ]);
            tabView.addAll([
              const SizedBox(child: NotificationList()),
              const SizedBox(child: NotificationLegacy()),
            ]);
            tabLength = 2;
            break;
          case "SERVICE":
            tab.addAll([
              const TabItem(title: 'eTEMP/iTemS'),
              const TabItem(title: 'Line Notify'),
            ]);
            tabView.addAll([
              const SizedBox(child: NotificationList()),
              const SizedBox(child: NotificationLegacy()),
            ]);
            tabLength = 2;
            break;
          default:
            final List<Ward> wards = [];
            for (var hospital in userState.hospital) {
              wards.addAll(hospital.ward!);
            }
        }

        return DefaultTabController(
          length: tabLength,
          child: Scaffold(
            appBar: tabbarBottomAppbar.appBarCustom(
              context,
              'แจ้งเตือน',
              tab,
              [
                IconButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationSettingsPage(),
                        ),
                      ),
                  icon: Icon(Icons.settings, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 20),
              ],
            ),
            body: TabBarView(children: tabView),
          ),
        );
      },
    );
  }
}
