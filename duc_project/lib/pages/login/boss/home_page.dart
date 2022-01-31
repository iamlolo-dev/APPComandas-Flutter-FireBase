import 'dart:io';

import 'package:duc_project/pages/menu/tapaeo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        child: column(context),
        onWillPop: () => exit(0),
      ),
    );
  }

  Widget column(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: const Icon(
            Icons.tapas_outlined,
          ),
          title: const Text("Tapeo"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TapeoPage(),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            Icons.lunch_dining_outlined,
          ),
          title: const Text("Hamburguesas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Ensaladas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Sandwiches"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Combined dishes"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Pizzas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () {},
        ),
      ],
    );
  }
}
