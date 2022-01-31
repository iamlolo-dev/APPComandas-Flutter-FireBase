import 'package:flutter/material.dart';

class BossHome extends StatelessWidget {
  const BossHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boss Home'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add a new Employee'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
