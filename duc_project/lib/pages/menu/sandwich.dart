import 'package:flutter/material.dart';

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
        children: const [
          ListTile(
            title: Text("Sandwich de pollo"),
          ),
          Divider(),
          ListTile(
            title: Text("Sandwich campestre"),
          ),
          Divider(),
          ListTile(
            title: Text("Sandwich nicois"),
          ),
          Divider(),
          ListTile(
            title: Text("Sandwich vegetal "),
          ),
        ],
      ),
    );
  }
}
