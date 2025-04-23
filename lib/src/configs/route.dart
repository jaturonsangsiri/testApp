import 'package:firstapp/src/pages/home_page.dart';
import 'package:firstapp/src/pages/login_page.dart';
import 'package:firstapp/src/pages/notification_page.dart';
import 'package:firstapp/src/pages/register_page.dart';
import 'package:flutter/material.dart';

class Route {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static const home = '/';
  static const login = '/login';
  static const notification = '/notification';
  static const register = '/register';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    notification: (context) => const NotificationPage(),
    register: (context) => const RegisterPage(),
  };
}
