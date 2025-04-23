import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firstapp/src/configs/route.dart' as custom_route;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // เรียกใช้เช็คขนาดหน้าจอเพื่อปรับ UI ตาม
    Responsive.init(context);
    return MaterialApp(
      navigatorKey: custom_route.Route.navigatorKey,
      scaffoldMessengerKey: custom_route.Route.scaffoldMessengerKey,
      initialRoute: '/login',
      routes: custom_route.Route.getAll(),
      // ไม่ให้แสดง banner debug สีแดง
      debugShowCheckedModeBanner: false,
      // ปรับให้แอปรองรับภาษาไทย
      locale: const Locale('th','TH'),
      supportedLocales: const [Locale('th','TH'), Locale('en','EN')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ปรับให้การเลือกเวลาเป็น forat 24 ชม.
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
    );
  }
}