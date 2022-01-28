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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.tapas_outlined,
            ),
            title: const Text("Tapeo"),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              Navigator.pushNamed(context, '/tapeo');
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
          )
        ],
      ),
    );
  }
}
