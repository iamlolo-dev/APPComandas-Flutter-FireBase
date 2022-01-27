import 'package:duc_project/pages/login/boss.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WorkFlow"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    FutureBuilder(
                        future: firebaseInitialized(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const BossPage();
                          } else {
                            return const CircularProgressIndicator();
                          }
                        });
                    Navigator.pushNamed(context, '/boss');
                  },
                  child: const Text("Boss"),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/employee'),
                  child: const Text("Employee"),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future firebaseInitialized() async {
    final inicio = await Firebase.initializeApp();
    return inicio;
  }
}
