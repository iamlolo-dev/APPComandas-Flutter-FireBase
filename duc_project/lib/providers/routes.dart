import 'package:duc_project/pages/login/boss/boss_chek.dart';
import 'package:duc_project/pages/login/employee.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/bosscheck':
        return MaterialPageRoute(builder: (_) => const BossCheck());
      case '/employee':
        return MaterialPageRoute(builder: (_) => const EmployeePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
