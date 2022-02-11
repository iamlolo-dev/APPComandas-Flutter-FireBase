import 'package:duc_project/pages/login/employee/employee.dart';
import 'package:flutter/material.dart';

//Esta pagina esta creada para añadire posteriormente un login a empleado a parte creado por el jefe, asi que aqui añadiriamos un 'defaultTabcontroller' y tendriamos las dos opciones en una pantalla
//por el momento nos envia a la pagina de registro normal del empleado. Registor que se completa con correo y password
class HallPage extends StatelessWidget {
  const HallPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hall"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const EmployeePage(),
      ),
    );
  }
}
