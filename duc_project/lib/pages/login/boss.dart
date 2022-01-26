import 'package:duc_project/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BossPage extends StatefulWidget {
  const BossPage({Key? key}) : super(key: key);

  @override
  State<BossPage> createState() => _BossPageState();
}

class _BossPageState extends State<BossPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boss"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            // TextButton(
            //   onPressed: () async {
            //     try {
            //       final user = await auth.signInWithEmailAndPassword(
            //           email: email, password: password);
            //       // ignore: unnecessary_null_comparison
            //       if (user != null) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return const MyHomePage();
            //             },
            //           ),
            //         );
            //       }
            //     } catch (e) {
            //       Fluttertoast.showToast(
            //           msg: e.toString(),
            //           toastLength: Toast.LENGTH_SHORT,
            //           gravity: ToastGravity.CENTER,
            //           timeInSecForIosWeb: 1,
            //           backgroundColor: Colors.red,
            //           textColor: Colors.white,
            //           fontSize: 16.0);
            //     }
            //   },
            //   child: const Text("Start!"),
            // ),
          ],
        ),
      ),
    );
  }
}
