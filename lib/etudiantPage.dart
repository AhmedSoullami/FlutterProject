import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'etudiant.dart'; 

class EtudiantPage extends StatelessWidget {
  final List<Etudiant> etudiants;

  EtudiantPage({required this.etudiants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Etudiants'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EtudiantList(etudiants: etudiants, onDelete: onDelete),
          SizedBox(height: 20),
          EtudiantForm(),
        ],
      ),
    );
  }

  onDelete(Etudiant etudiant) async {
    try {
      await FirebaseFirestore.instance
          .collection('dbproducts')
          .doc(etudiant.id)
          .delete();
    } catch (e) {
      print('Error deleting etudiant: $e');
    }
  }
}

class EtudiantList extends StatelessWidget {
  final List<Etudiant> etudiants;
  final Function(Etudiant) onDelete;

  EtudiantList({required this.etudiants, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Prénom')),
          DataColumn(label: Text('Nom')),
          DataColumn(label: Text('Note')),
          DataColumn(label: Text('Actions')),
        ],
        rows: etudiants
            .map(
              (etudiant) => DataRow(
                cells: [
                  DataCell(Text(etudiant.prenom)),
                  DataCell(Text(etudiant.nom)),
                  DataCell(Text(etudiant.note.toString())),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        onDelete(etudiant);
                      },
                    ),
                    
                  ),
                  
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class EtudiantForm extends StatefulWidget {
  @override
  _EtudiantFormState createState() => _EtudiantFormState();
}

class _EtudiantFormState extends State<EtudiantForm> {
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: prenomController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextFormField(
              controller: nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(labelText: 'Note'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String prenom = prenomController.text;
                String nom = nomController.text;
                int note = int.tryParse(noteController.text) ?? 0;

                if (prenom.isEmpty || nom.isEmpty) {
                  return;
                }

                Etudiant newEtudiant = Etudiant(
                  id: '',
                  prenom: prenom,
                  nom: nom,
                  note: note,
                );

                try {
                  await FirebaseFirestore.instance
                      .collection('dbproducts')
                      .add(newEtudiant.toMap());

                  prenomController.clear();
                  nomController.clear();
                  noteController.clear();
                } catch (e) {
                  print('Error adding etudiant: $e');
                }
              },
              child: Text('Ajouter Étudiant'),
            ),
          ],
        ),
      ),
    );
  }
} 

