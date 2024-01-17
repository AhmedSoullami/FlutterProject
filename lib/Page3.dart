import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page 3',
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
