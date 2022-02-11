import 'package:flutter/material.dart';

import '../home_page.dart';

class SandwichPage extends StatelessWidget {
  //Lista de los platos de sandwich
  var listado = [
    'Sandwich de pollo',
    'Sandwich campestre',
    'Sandwich nicois',
    'Sandwich vegetal'
  ];
  SandwichPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandwiches"),
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
            HomePage.arrays("${listado[index]} (${opciones.text})");
          },
        );
      },
    );
  }
}
