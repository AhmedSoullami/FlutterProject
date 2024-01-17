import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerTest extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/etudiant');
          },
          child: Text("Liste des Etudiants"),
        ),
      ),
      drawer: Drawer(
        child: FutureBuilder<User?>(
          future: getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading user');
            } else {
              User? user = snapshot.data;
              return Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountEmail: Text(user?.email ?? 'No Email'),
                    accountName: Text(user?.displayName ?? ''),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/rajaraja.png"),
                      backgroundColor: Colors.green,
                      radius: 50,
                    ),
                  ),
                  ListTile(
                    title: Text("Profile"),
                    trailing: Icon(Icons.arrow_right_outlined, color: Colors.green),
                    leading: Icon(Icons.person, color: Colors.green),
                    onTap: () {
                      
                    },
                  ),
                  ListTile(
                    title: Text("School"),
                    trailing: Icon(Icons.arrow_right_outlined, color: Colors.green),
                    leading: Icon(Icons.school, color: Colors.green),
                    onTap: () {
                      Navigator.pushNamed(context, "/school");
                    },
                  ),
                  ListTile(
                    title: Text("Parametre"),
                    trailing: Icon(Icons.arrow_right_outlined, color: Colors.green),
                    leading: Icon(Icons.settings, color: Colors.green),
                    onTap: () {
                      Navigator.pushNamed(context, "/parametre");
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
