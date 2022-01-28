import 'package:duc_project/providers/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BossLogin extends StatefulWidget {
  const BossLogin({Key? key}) : super(key: key);

  @override
  State<BossLogin> createState() => _BossLoginState();
}

class _BossLoginState extends State<BossLogin> {
  FirebaseAuth auth = FirebaseAuth.instance;
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
                User? result = await AuthService()
                    .signInUser(emailController.text, passwordController.text);
                if (result != null) {
                  print('Success');
                  print(result.email);
                  Navigator.pushNamed(context, '/homepage');
                }
              }
            },
            child: const Text("Go!"),
          ),
          TextButton(
              onPressed: () {},
              child: const Text("You already haven`t an account? Click here."))
        ],
      ),
    ));
  }
}
