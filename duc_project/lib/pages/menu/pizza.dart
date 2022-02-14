import 'package:flutter/material.dart';

import '../home_page.dart';

class PizzaPage extends StatelessWidget {
  //List[] de los platos de pizzas para crear el ListView
  var listado = [
    'BBQ',
    'Carbonara',
    'Nórdica',
    '4 quesos',
    'Campesina',
    'proscuito'
  ];
  PizzaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizzas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _generarListView(),
          ),
        ],
      ),
    );
  }

  ListView _generarListView() {
    return ListView.builder(
      itemCount: listado.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(listado[index]),
          //onTap async para que el showDialow espere a cerrarse para que el controller almacene la info al 'onEditComplete'
          onTap: () async {
            //Controlador para el TextField
            TextEditingController opciones = TextEditingController();
            //Método para abrir pantalla emergente
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                //Pantalla emergente
                return AlertDialog(
                  actions: [
                    //Casilla para añadir la info adicional del pedido
                    TextField(
                      //Controla cada vez que modificamos el TextField, es decir, cada vez que escribimos se guarda automaticamente
                      controller: opciones,
                      //Sirve para cuando le des enter directamente se cierre, para no tener que implementar un boton con función de Send
                      onEditingComplete: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            //Añadimos lo seleccionado al Map de home_page.dart
            //Si no tenemos cambios en la comida se añade el plato simplemente. Si tenemos cambios en el controller del TextField
            //visto arriba y lo añadimos a la Database junto con el cambio.
            if (opciones.text.isEmpty) {
              HomePage.arrays(listado[index]);
            } else {
              HomePage.arrays("${listado[index]} (${opciones.text})");
            }
          },
        );
      },
    );
  }
}
