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
        children: const [
          ListTile(
            title: Text("BBQ"),
          ),
          Divider(),
          ListTile(
            title: Text("Carbonara"),
          ),
          Divider(),
          ListTile(
            title: Text("Nórdica"),
          ),
          Divider(),
          ListTile(
            title: Text("4 Quesos"),
          ),
          Divider(),
          ListTile(
            title: Text("Campesina"),
          ),
          Divider(),
          ListTile(
            title: Text("Sabrosa"),
          ),
          Divider(),
          ListTile(
            title: Text("Proscuito"),
          ),
          Divider(),
          ListTile(
            title: Text("Duc 1985"),
          ),
        ],
      ),
    );
  }
}
