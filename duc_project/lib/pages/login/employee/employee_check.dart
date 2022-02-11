import 'package:duc_project/pages/home_page.dart';

import 'package:duc_project/pages/login/boss/boss_login.dart';
import 'package:duc_project/providers/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmployeeCheck extends StatefulWidget {
  const EmployeeCheck({Key? key}) : super(key: key);

  @override
  State<EmployeeCheck> createState() => _EmployeeCheckState();
}

//Registro del empleado
class _EmployeeCheckState extends State<EmployeeCheck> {
  //Instancia de la base de datos para poder utilizar Authentication Firebase
  FirebaseAuth auth = FirebaseAuth.instance;

  //Controladores para el contenido de la TextField
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Logo del restaurante
          const Image(
            image: AssetImage('assets/Duclogo.jpeg'),
          ),
          const Divider(),
          //Box del email
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              textAlign: TextAlign.center,
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

          //Box del password
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              textAlign: TextAlign.center,
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

          //Box delconfirm password
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              textAlign: TextAlign.center,
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Confirm password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),

          //Boton para enviar los datos de las TextField anteriores al Firestore con ayuda de los controllers.
          ElevatedButton(
            onPressed: () async {
              if (emailController.text == "" || passwordController.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("All fields are required!"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (passwordController.text !=
                  confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Passwords don`t match!"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (!EmailValidator.validate(emailController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Try with a correct mail!"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                User? result = await AuthService().registerUser(
                    emailController.text, passwordController.text);
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
            child: const Text("Submit"),
          ),

          //Botón para cambiar a la pantalla de logeo si estas registrado ya
          TextButton(
            child: const Text("You already have an account? Click here."),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BossLogin(),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
