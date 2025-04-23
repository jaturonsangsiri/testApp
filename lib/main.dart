import 'package:firstapp/src/app.dart';
import 'package:firstapp/src/bloc/home/home_bloc.dart';
import 'package:firstapp/src/bloc/probe/probe_setting_bloc.dart';
import 'package:firstapp/src/bloc/user/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // ดึง Bloc ทั้งหมดมา
  // Bloc ตัวตั้งค่าโพรบ
  final probeBloc = BlocProvider<ProbeSettingBloc>(create: (context) => ProbeSettingBloc());
  final homeBloc = BlocProvider<HomeBloc>(create: (context) => HomeBloc());
  final userBloc = BlocProvider<UsersBloc>(create: (context) => UsersBloc());

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // จัดการเกี่ยวกับหน้า Splash Screen (หน้าโหลดก่อนเข้าแอป)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // ทำการโหลดข้อมูลที่ต้องการใช้งานก่อนเข้าแอป
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(
    MultiBlocProvider(
      providers: [probeBloc, homeBloc, userBloc], 
      child: const App()
    ),
  );
}