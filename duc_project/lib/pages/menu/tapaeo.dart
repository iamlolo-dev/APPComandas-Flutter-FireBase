import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duc_project/pages/login/employee/home_page.dart';
import 'package:flutter/material.dart';

class TapeoPage extends StatelessWidget {
  TapeoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tapeo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers

          ListTile(
            title: const Text("Patatas bravas"),
            onTap: () {
              HomePage.arrays("Patatas bravas");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Nachos Mix"),
            onTap: () {
              HomePage.arrays("Nachos Mix");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Fingers Pollo"),
            onTap: () {
              HomePage.arrays("Fingers Pollo");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Fingers queso"),
            onTap: () {
              HomePage.arrays("Fingers queso");
            },
          ),
        ],
      ),
    );
  }
}
