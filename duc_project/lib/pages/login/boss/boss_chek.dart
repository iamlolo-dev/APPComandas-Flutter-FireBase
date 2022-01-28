import 'package:duc_project/providers/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BossCheck extends StatefulWidget {
  const BossCheck({Key? key}) : super(key: key);

  @override
  State<BossCheck> createState() => _BossCheckState();
}

class _BossCheckState extends State<BossCheck> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Boss"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/Duclogo.jpeg'),
              ),
              const Divider(),
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
              ElevatedButton(
                onPressed: () async {
                  if (emailController.text == "" ||
                      passwordController.text == "") {
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
                    }
                  }
                },
                child: const Text("Submit"),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("You already have an account? Click here."))
            ],
          ),
        ));
  }
}
