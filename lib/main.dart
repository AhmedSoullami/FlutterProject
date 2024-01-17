import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flluter2/FirstPage.dart';
import 'package:flluter2/drawerTest.dart';
import 'package:flluter2/etudiant.dart';
import 'package:flluter2/etudiantPage.dart';
import 'package:flluter2/formulaire.dart';
import 'package:flluter2/login.dart';
import 'package:flluter2/register.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC8hhIOhZRC6DgM4nkgEI7sqf1ppTeHp5o",
      appId: "1:1015736934607:web:2b094129edf30904b057ba",
      messagingSenderId: "1015736934607",
      projectId: "projetflutter-f7e7c",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Login(),
        '/registration': (context) => Registration(),
        '/drawer': (context) => DrawerTest(),
        '/firstPage': (context) => FirstPage(),
        '/formulaire': (context) => Formulaire(),
        '/etudiant': (context) => FutureBuilder<List<Etudiant>>(
          future: getEtudiants(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading etudiants');
            } else {
              return EtudiantPage(etudiants: snapshot.data ?? []);
            }
          },
        ),
      },
    );
  }

 Future<List<Etudiant>> getEtudiants() async {
  try {
    CollectionReference etudiantsCollection =
        FirebaseFirestore.instance.collection('dbproducts');

    QuerySnapshot querySnapshot = await etudiantsCollection.get();

    List<Etudiant> etudiants = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      String id = doc.id;
      String prenom = data['prenom'] ?? '';
      String nom = data['nom'] ?? '';
      int note = data['note'] ?? 0;
     

      return Etudiant(
        id: id,
        prenom: prenom,
        nom: nom,
        note: note,
        
      );
    }).toList();

    return etudiants;
  } catch (e) {
    print('Error fetching etudiants: $e');
    return [];
  }
}

}
