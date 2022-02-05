import 'package:flutter/material.dart';

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
        children: const [
          ListTile(
            title: Text("Plato combinado de pechuga"),
          ),
          Divider(),
          ListTile(
            title: Text("Plato combinado de lomo"),
          ),
          Divider(),
          ListTile(
            title: Text("Plato combinado de ternera"),
          ),
        ],
      ),
    );
  }
}
