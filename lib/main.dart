import 'package:firstapp/src/app.dart';
import 'package:firstapp/src/bloc/device/devices_bloc.dart';
import 'package:firstapp/src/bloc/notification/notification_bloc.dart';
import 'package:firstapp/src/bloc/probe/probe_setting_bloc.dart';
import 'package:firstapp/src/bloc/theme/theme_bloc.dart';
import 'package:firstapp/src/bloc/user/users_bloc.dart';
import 'package:firstapp/src/services/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // ดึง Bloc ทั้งหมดมา
  // Bloc ตัวตั้งค่าโพรบ
  final probeBloc = BlocProvider<ProbeSettingBloc>(create: (context) => ProbeSettingBloc());
  final devicesBloc = BlocProvider<DevicesBloc>(create: (context) => DevicesBloc());
  final userBloc = BlocProvider<UsersBloc>(create: (context) => UsersBloc());
  final notificationBloc = BlocProvider(create: (context) => NotificationBloc());
  final themeBloc = BlocProvider(create: (context) => ThemeBloc());

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // จัดการเกี่ยวกับหน้า Splash Screen (หน้าโหลดก่อนเข้าแอป)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // ทำการโหลดข้อมูลที่ต้องการใช้งานก่อนเข้าแอป
  final configStorage = ConfigStorage();
  bool theme = await configStorage.getTheme() ?? false;

  FlutterNativeSplash.remove();
  runApp(
    MultiBlocProvider(
      providers: [probeBloc, devicesBloc, userBloc, notificationBloc, themeBloc], 
      child: App(theme: theme,),
    ),
  );
}