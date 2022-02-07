import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duc_project/pages/menu/ensalada.dart';
import 'package:duc_project/pages/menu/hamburguesa.dart';
import 'package:duc_project/pages/menu/pizza.dart';
import 'package:duc_project/pages/menu/plato_combinado.dart';
import 'package:duc_project/pages/menu/sandwich.dart';
import 'package:duc_project/pages/menu/tapaeo.dart';
import 'package:flutter/material.dart';

var array = [];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  static void arrays(String s) {
    array.add(s);
  }
}

class _HomePageState extends State<HomePage> {
  final firestoreInstance = FirebaseFirestore.instance;
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
                builder: (context) => TapeoPage(),
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HamburguesaPage()),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Ensaladas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnsaladaPage()),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Sandwiches"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SandwichPage()),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Platos combinados"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CombinadosPage()),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Pizzas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PizzaPage()),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print(array);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("It's all?"),
                      centerTitle: true,
                    ),
                    body: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: _crearItemCorto(),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            array.clear();
                          },
                          child: const Text("YES"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          child: const Text("Finalizar"),
        ),
      ],
    );
  }

  List<Widget> _crearItemCorto() {
    var widget = array
        .map(
          (e) => Column(
            children: [
              ListTile(
                title: Text(e),
                leading: const Icon(Icons.restaurant),
              ),
              const Divider(
                indent: 60,
                endIndent: 60,
              ),
            ],
          ),
        )
        .toList();

    return widget;
  }
}
