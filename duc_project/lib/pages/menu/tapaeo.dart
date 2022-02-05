import 'package:flutter/material.dart';

class TapeoPage extends StatelessWidget {
  const TapeoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tapeo"),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          ListTile(
            title: Text("Patatas bravas"),
          ),
          Divider(),
          ListTile(
            title: Text("Nachos Mix"),
          ),
          Divider(),
          ListTile(
            title: Text("Fingers Pollo"),
          ),
          Divider(),
          ListTile(
            title: Text("Fingers queso"),
          )
        ],
      ),
    );
  }
}
