import 'package:flutter/material.dart';

import '../login/employee/home_page.dart';

class CombinadosPage extends StatelessWidget {
  const CombinadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platos combinados"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Plato combinado de pechuga"),
            onTap: () {
              HomePage.arrays("Plato C Pechuga");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Plato combinado de lomo"),
            onTap: () {
              HomePage.arrays("Plato C Lomo");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Plato combinado de ternera"),
            onTap: () {
              HomePage.arrays("Plato C Ternera");
            },
          ),
        ],
      ),
    );
  }
}
