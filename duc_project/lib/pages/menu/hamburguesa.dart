import 'package:flutter/material.dart';

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
        children: const [
          ListTile(
            title: Text("Hamburguesas"),
          ),
          Divider(),
          ListTile(
            title: Text("Burguer maxi"),
          ),
          Divider(),
          ListTile(
            title: Text("Burguer completa"),
          ),
          Divider(),
          ListTile(
            title: Text("Burguer Ranchera con Queso de Cabra"),
          ),
          Divider(),
          ListTile(
            title: Text("Burguer Ranchera con Foie y Queso Brie"),
          ),
        ],
      ),
    );
  }
}
