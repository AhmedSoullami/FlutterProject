import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              'Bonjour',
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Retour au menu'),
            ),
          ],
        ),
      ),
    );
  }
}
