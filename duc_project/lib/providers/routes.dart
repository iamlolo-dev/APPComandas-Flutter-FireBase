import 'package:duc_project/pages/login/boss.dart';
import 'package:duc_project/pages/login/employee.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/boss':
        return MaterialPageRoute(builder: (_) => const BossPage());
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
