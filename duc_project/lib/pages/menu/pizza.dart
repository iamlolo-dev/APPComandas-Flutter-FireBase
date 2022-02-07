import 'package:flutter/material.dart';

import '../login/employee/home_page.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizzas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("BBQ"),
            onTap: () {
              HomePage.arrays("BBQ");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Carbonara"),
            onTap: () {
              HomePage.arrays("carbonara");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Nórdica"),
            onTap: () {
              HomePage.arrays("Nórdica");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("4 Quesos"),
            onTap: () {
              HomePage.arrays("4 Quesos");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Campesina"),
            onTap: () {
              HomePage.arrays("Campesina");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sabrosa"),
            onTap: () {
              HomePage.arrays("Sabrosa");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Proscuito"),
            onTap: () {
              HomePage.arrays("Proscuito");
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Duc 1985"),
            onTap: () {
              HomePage.arrays("Duc 1985");
            },
          ),
        ],
      ),
    );
  }
}
