import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duc_project/providers/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home_page.dart';
import 'employee_check.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  //Instancia Firebase para la funcion Authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  //Controladores para el texto introducido en los TextField
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            //Logo del Duc
            image: AssetImage('assets/Duclogo.jpeg'),
          ),
          const Divider(),
          //Box para introducir el Email
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              textAlign: TextAlign.center,

              //Controlamos el texto que añadimos para pasarlo posterirormente a Firebase
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          //Box para introducir el password
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              textAlign: TextAlign.center,
              //Controlamos el texto que añadimos para pasarlo posterirormente a Firebase
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          //Boton para comprobar los datos y, si concuerdan enviarlos a Firebase
          ElevatedButton(
            onPressed: () async {
              if (emailController.text == "" || passwordController.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("All fields are required!"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                //Método que nos ayuda para el check del correo y password ya cotejadas en la Dartabase Auth
                User? result = await AuthService()
                    .signInUser(emailController.text, passwordController.text);
                if (result != null) {
                  print('Success');
                  print(result.email);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }
              }
            },
            child: const Text("Go!"),
          ),
          //Cambiar a la ventana de creación de cuenta
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmployeeCheck())),
              child: const Text("You already haven`t an account? Click here."))
        ],
      ),
    ));
  }
}
