import 'package:flutter/material.dart';

import '../login/employee/home_page.dart';

class HamburguesaPage extends StatelessWidget {
  const HamburguesaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hamburguesas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Hamburguesa"),
            onTap: () {
              HomePage.arrays("Hamburguesa");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Burguer maxi"),
            onTap: () {
              HomePage.arrays("Burguer maxi");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Burguer completa"),
            onTap: () {
              HomePage.arrays("Burguer completa");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Burguer Ranchera con Queso de Cabra"),
            onTap: () {
              HomePage.arrays("Burguer ranchera cabra");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Burguer Ranchera con Foie y Queso Brie"),
            onTap: () {
              HomePage.arrays("Burguer ranchera foie y brie");
            },
          ),
        ],
      ),
    );
  }
}
