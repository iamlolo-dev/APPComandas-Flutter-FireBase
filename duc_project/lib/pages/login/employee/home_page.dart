import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duc_project/pages/menu/ensalada.dart';
import 'package:duc_project/pages/menu/hamburguesa.dart';
import 'package:duc_project/pages/menu/pizza.dart';
import 'package:duc_project/pages/menu/plato_combinado.dart';
import 'package:duc_project/pages/menu/sandwich.dart';
import 'package:duc_project/pages/menu/tapaeo.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> array = {};

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  static void arrays(String pedido) {
    if (array.isEmpty) {
      array.addEntries([MapEntry('order 1', pedido)]);
    } else
    array.addEntries([MapEntry('order ${array.length + 1}', pedido)]);
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
                          child: _generarListView(),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            firestoreInstance.collection('menu').add(array);
                            array.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Finalizar pedido"),
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

  ListView _generarListView() {
    final List<String> lista = [];
    array.forEach(
      (key, value) {
        lista.add("$key: $value");
      },
    );

    // return widget;
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(lista[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() => array.remove("order " + index.toString()));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order $index eliminado.'),
              ),
            );
          },
          background: Container(
            color: Colors.red,
          ),
          child: ListTile(
            title: Text(lista[index]),
          ),
        );
      },
    );
  }
}
