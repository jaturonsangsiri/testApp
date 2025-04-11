import 'package:firstapp/src/bloc/layout_bloc.dart';
import 'package:firstapp/src/pages/home_page.dart';
import 'package:firstapp/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      // กำหนดเส้นทางหน้าต่างๆของแอป
      routes: <String, WidgetBuilder> {
        'Home': (BuildContext context) => HomePage(),
      },
      home: BlocProvider(
        create: (_) => LayoutBloc(),
        child: const LoginPage(),
      ),
    );
  }
}