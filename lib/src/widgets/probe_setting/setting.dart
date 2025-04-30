import 'package:firstapp/src/bloc/theme/theme_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/probe_setting/notification_setting.dart';
import 'package:firstapp/src/widgets/probe_setting/report_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // เนื้อหาการตั้งค่า
        Expanded(
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return Container(
                color: themeState.themeApp? fourColorDark : Colors.white,
                child: ListView(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  children: [
                    NotificationSetting(),
                    ReportSetting(),
                  ],
                ),
              );
            },
          )
        ),
      ],
    );
  }
}