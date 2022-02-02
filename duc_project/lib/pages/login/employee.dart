import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'boss/home_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final _firestore = FirebaseFirestore.instance;
  var sRef;
  List<String> num = ["id"];
  final TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              controller: numController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Employee number',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              try {
                for (var i = 0; i < num.length; i++) {
                  sRef = _firestore.collection("users").get();
                }
              } catch (e) {}
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text("Go!"),
          )
        ],
      ),
    );
  }
}
