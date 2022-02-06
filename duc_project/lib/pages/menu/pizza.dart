import 'package:flutter/material.dart';

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
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Carbonara"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Nórdica"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("4 Quesos"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Campesina"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Sabrosa"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Proscuito"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Duc 1985"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
