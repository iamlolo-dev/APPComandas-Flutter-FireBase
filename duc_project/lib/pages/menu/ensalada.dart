import 'package:flutter/material.dart';

class EnsaladaPage extends StatelessWidget {
  const EnsaladaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ensaladas"),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          ListTile(
            title: Text("Ensalada cesar"),
          ),
          Divider(),
          ListTile(
            title: Text("Ensalada bonita"),
          ),
          Divider(),
          ListTile(
            title: Text("Ensalada con queso de cabra"),
          ),
        ],
      ),
    );
  }
}
