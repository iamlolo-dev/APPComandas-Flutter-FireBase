import 'package:duc_project/pages/home_page.dart';
import 'package:flutter/material.dart';

class TapeoPage extends StatelessWidget {
  //Listado del menu
  var listado = [
    'Patatas bravas',
    'Nachos mix',
    'Fingers pollo',
    'Fingers queso'
  ];
  TapeoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tapeo"),
        centerTitle: true,
      ),
      body: Column(
        //Donde desplegamos el listView, lo queremos en columna, y como no nos deja añadir el ListView directamente como 'children', lo añadimos a un Expanded.
        //Expanded sirve para adecuar el tamaño del objeto al necesario para adaptarlo a la pantalla.
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
                      controller: opciones,
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
