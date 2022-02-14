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
    } else {
      array.addEntries([MapEntry('order ${array.length + 1}', pedido)]);
    }
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

  //Tipos de comida: tapeo, ensalada, hamburguesa, sandwich, pizza, platos combinados
  Widget column(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //ListTile que contiene los platos de Tapas
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
        //ListTile que contiene los platos de Hamburguesas
        ListTile(
          leading: const Icon(
            Icons.lunch_dining_outlined,
          ),
          title: const Text("Hamburguesas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HamburguesaPage()),
          ),
        ),
        const Divider(),
        //ListTile que contiene los platos de Ensaladas
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
        //ListTile que contiene los platos de Sandwiches
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Sandwiches"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SandwichPage()),
          ),
        ),
        const Divider(),
        //ListTile que contiene los Platos combinados
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Platos combinados"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CombinadosPage()),
          ),
        ),
        const Divider(),
        //ListTile que contiene las Pizzas
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Pizzas"),
          trailing: const Icon(Icons.navigate_next_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PizzaPage()),
          ),
        ),
        const Divider(),
        //Botón que despliega un MaterialPageRoute, donde creamos una pagina al momento en el que nos muestra el pedido relaizado.
        //También contiene el botón con el clual subimos el pedido a la DataBase
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
                            //Aqui es donde se añade el pedido a la Database
                            firestoreInstance.collection('menu').add(array);
                            //Luego limpiamos el Map para el siguiente pedido
                            array.clear();
                            //Salimos a la pantalla anterior
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

  //Menú de finalizar pedido, función de enviar a Database o eliminar 'order'.
  ListView _generarListView() {
    final List<String> lista = [];
    array.forEach(
      (key, value) {
        lista.add("$key: $value");
      },
    );

    return ListView.builder(
      //Tamaño de la list
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int index) {
        //Método que nos permite eliminar los objetos de la lista deslizando.
        return Dismissible(
          //La llave sirve para saber que item de la lista seleccionamos para eliminarlo
          key: Key(lista[index]),
          //Aqui tenemos la dirección en la que se elimina el objeto, en este caso es de final a principio
          direction: DismissDirection.endToStart,
          //Función: lo que pasa cuando deslizamos
          onDismissed: (direction) {
            //aqui eliminamos el objeto directamente del Map, asi se destruye también de la List.
            setState(() => array.remove("order " + index.toString()));
            //Mostramos un snackBar notificando que hemos eliminado un objeto
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order $index eliminado.'),
              ),
            );
          },
          //Color que se muestra al deslizar
          background: Container(
            color: Colors.red,
          ),
          //ListTile donde se aplica Dismissible
          child: ListTile(
            title: Text(lista[index]),
          ),
        );
      },
    );
  }
}
