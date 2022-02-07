import 'package:flutter/material.dart';

import '../login/employee/home_page.dart';

class SandwichPage extends StatelessWidget {
  const SandwichPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandwiches"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Sandwich de pollo"),
            onTap: () {
              HomePage.arrays("Sandwich pollo");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sandwich campestre"),
            onTap: () {
              HomePage.arrays("Sandwich campestre");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sandwich nicois"),
            onTap: () {
              HomePage.arrays("Sandwich nicois");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sandwich vegetal "),
            onTap: () {
              HomePage.arrays("Snadwich vegetal");
            },
          ),
        ],
      ),
    );
  }
}
