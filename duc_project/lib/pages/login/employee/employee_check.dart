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

  //Controladores para el contenido de la TextField. Tenemos uno para el email, y luego dos de password que mas adelante sabremos para que lo utilizamos
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo del restaurante
            const Image(
              image: AssetImage('assets/Duclogo.jpeg'),
            ),
            const Divider(),
            //Box del email-'SizedBox' sirve para añadir el tamaño al TextField
            SizedBox(
              //Tamaño del TextField
              width: 350,
              height: 70,
              child: TextField(
                textAlign: TextAlign.center,
                //Controlamos el texto añadido en el TextField
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  //Se encarga de añadir borde al TextField
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
                //Ocultamos el contenido debido a que es una password
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

            //Box del confirmPpassword
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
                //Este if se encarga de comprovar si la casilla de email o password son empty, por lo tanto no nos dejara registrarnos y nos mostrara un snackBar informandonos
                //del error.
                if (emailController.text == "" ||
                    passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("All fields are required!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  /*Este else if se encarga de comprovar si password y confirmPassword son idénticos, si no lo son nos muestra un snackBar informandonos de ello*/
                } else if (passwordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Passwords don`t match!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  /*Por último, este 'else if' se encarga de comprovar que el email introducido es correcto, si no, mostrará un snackBar informandonos del error */
                } else if (!EmailValidator.validate(emailController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Try with a correct mail!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  /*Por último, en el 'else' tenemos el registro del usuario, ya que cumple con todos los requisitos que anteriormente hemos visto*/
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

            //Botón para navegar a la pantalla de logeo si ya estas registrado
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
      ),
    ));
  }
}
