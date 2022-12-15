import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

//ici on a une classe qui represente un utilisateur avec tout ses attributs
class User {
  String? id;
  String? prenom;
  String? nom;
  int? age;
  String? email;
  String? nationaliter;
  User({
    this.id,
    this.prenom,
    required this.nom,
    this.age,
    this.email,
    this.nationaliter
  });

  //ici on a une methode qui permet de copier un utilisateur et de modifier ses attributs
  User copyWith({
    String? id,
    String? prenom,
    String? nom,
    int? age,
    String? email,
    String? nationaliter
  }) {
    return User(
      id: id ?? this.id,
      prenom: prenom ?? this.prenom,
      nom: nom ?? this.nom,
      age: age ?? this.age,
      email: email ?? this.email,
      nationaliter: nationaliter ?? this.nationaliter
    );
  }

  //ici on a une methode qui permet de convertir un utilisateur en map
  Map<String, dynamic> toMap({bool withId = true}) {
    return {
      if (withId) 'id': id,
      'isbn': prenom,
      'titre': nom,
      'auteur_id': age,
      'langage': email,
      'description': nationaliter
    };
  }

  //ici on a une methode qui utilise la map pour creer un utilisateur
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] is ObjectId
          ? map['_id'].toHexString()
          : map['_id'].toString(),
      prenom: map['prenom'] != null ? map['prenom'].toString() : null,
      nom: map['nom'] != null ? map['nom'].toString() : null,
      age: map['age'],
      email: map['email'] != null ? map['eamil'].toString() : null,
      nationaliter: map['nationaliter'] != null ? map['nationaliter'].toString() : null,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Livre(id: $id, isbn: $prenom, titre: $nom, auteurId: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.prenom == prenom &&
        other.nom == nom &&
        other.age == age;
  }

  @override
  int get hashCode {
    return id.hashCode ^ prenom.hashCode ^ nom.hashCode ^ age.hashCode;
  }
}
