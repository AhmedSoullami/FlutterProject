import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/1.png", height: 160, width: 160),
                SizedBox(width: 40),
                Image.asset("images/3.png", height: 160, width: 160),
                
              ],
            ),
            SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                   Navigator.of(context).pop();
                  },
                  child: Text('Afficher le detaille'),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).pop();
                  },
                  child: Text('Afficher le detaille'),
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
