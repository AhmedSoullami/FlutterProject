class Etudiant {
  String id;
  String prenom;
  String nom;
  int note;
 

  Etudiant({
    required this.id,
    required this.prenom,
    required this.nom,
    required this.note,
    
  });

  factory Etudiant.fromMap(String id, Map<String, dynamic> data) {
    return Etudiant(
      id: id,
      prenom: data['prenom'] ?? '',
      nom: data['nom'] ?? '',
      note: data['note'] ?? 0,
      
    );
  }
    Map<String, dynamic> toMap() {
    return {
      'prenom': prenom,
      'nom': nom,
      'note': note,
    
    };
  }

}
