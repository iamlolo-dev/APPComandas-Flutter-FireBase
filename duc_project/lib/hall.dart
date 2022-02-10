import 'package:duc_project/pages/login/boss/boss_login.dart';
import 'package:duc_project/pages/login/employee/employee.dart';
import 'package:flutter/material.dart';

class HallPage extends StatelessWidget {
  const HallPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Hall"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: const EmployeePage(),
        ),
      ),
    );
  }
}
