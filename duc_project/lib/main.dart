import 'package:duc_project/pages/home_page.dart';
import 'package:duc_project/pages/login/boss.dart';
import 'package:duc_project/pages/login/employee.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duc project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/boss': (context) => const BossPage(),
        '/employee': (context) => const EmployeePage(),
      },
    );
  }
}
