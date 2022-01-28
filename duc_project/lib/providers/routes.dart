import 'package:duc_project/pages/login/boss/boss_check.dart';
import 'package:duc_project/pages/login/boss/boss_login.dart';
import 'package:duc_project/pages/login/boss/home_page.dart';
import 'package:duc_project/pages/login/employee.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/bosscheck':
        return MaterialPageRoute(builder: (_) => const BossCheck());
      case '/bosslogin':
        return MaterialPageRoute(builder: (_) => const BossLogin());
      case '/employee':
        return MaterialPageRoute(builder: (_) => const EmployeePage());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
