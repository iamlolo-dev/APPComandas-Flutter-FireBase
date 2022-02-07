import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BossHome extends StatefulWidget {
  const BossHome({Key? key}) : super(key: key);

  @override
  State<BossHome> createState() => _BossHomeState();
}

class _BossHomeState extends State<BossHome> {
  final firestoreInstance = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boss Home'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: WillPopScope(
        child: column(context),
        onWillPop: () => exit(0),
      ),
    );
  }

  Column column(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 400,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Scrollbar(
            isAlwaysShown: true,
            child: StreamBuilder<QuerySnapshot>(
              stream: users,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("An error has ocurred"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                final data = snapshot.requireData;

                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Name: ${data.docs[index]['name']}"),
                        subtitle: Text("ID: ${data.docs[index]['id']}"),
                      );
                    });
              },
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Add a new Employee'),
          onPressed: () {
            _openDialog(context);
            numController.clear();
            nameController.clear();
          },
        ),
      ],
    );
  }

  void _openDialog(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.close_outlined),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text('Random code'),
              centerTitle: true,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    firestoreInstance.collection("users").add(
                      {
                        "name": nameController.text,
                        "id": numController.text,
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
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
                      controller: numController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Employee code',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
