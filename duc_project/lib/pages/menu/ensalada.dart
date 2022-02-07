import 'package:flutter/material.dart';

import '../login/employee/home_page.dart';

class EnsaladaPage extends StatelessWidget {
  EnsaladaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ensaladas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Ensalada cesar"),
            onTap: () {
              HomePage.arrays("Ensalada cesar");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Ensalada bonita"),
            onTap: () {
              HomePage.arrays("Ensalada bonita");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Ensalada con queso de cabra"),
            onTap: () {
              HomePage.arrays("Ensalada con queso de cabra");
            },
          ),
        ],
      ),
    );
  }
}
