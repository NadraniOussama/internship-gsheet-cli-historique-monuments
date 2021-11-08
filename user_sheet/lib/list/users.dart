// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

/*import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
    required this.nom,
    required this.dateConstruction,
    required this.epoqueConstruction,
    required this.personneHistorique,
    required this.descriptionHistorique,
    required this.lien,
    required this.categorie,
    this.prixAcces,
    this.surface,
    required this.positionCarte,
    required this.image,
  });

  String id;
  String nom;
  String dateConstruction;
  String epoqueConstruction;
  String personneHistorique;
  String descriptionHistorique;
  String lien;
  String categorie;
  dynamic prixAcces;
  dynamic surface;
  String positionCarte;
  String image;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    nom: json["nom"],
    dateConstruction: json["dateConstruction"],
    epoqueConstruction: json["epoqueConstruction"],
    personneHistorique: json["personneHistorique"],
    descriptionHistorique: json["descriptionHistorique"],
    lien: json["lien"],
    categorie: json["categorie"],
    prixAcces: json["prixAcces"],
    surface: json["surface"],
    positionCarte: json["positionCarte"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "dateConstruction": dateConstruction,
    "epoqueConstruction": epoqueConstruction,
    "personneHistorique": personneHistorique,
    "descriptionHistorique": descriptionHistorique,
    "lien": lien,
    "categorie": categorie,
    "prixAcces": prixAcces,
    "surface": surface,
    "positionCarte": positionCarte,
    "image": image,
  };
}*/

// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
    required this.nom,
    required this.dateConstruction,
    required this.epoqueConstruction,
    required this.personneHistorique,
    required this.descriptionHistorique,
    required this.lien,
    required this.categorie,
    required this.prixAcces,
    required this.surface,
    required this.positionCarte,
    required this.image,
  });

  int id;
  var nom;
  var dateConstruction;
  var epoqueConstruction;
  var personneHistorique;
  var descriptionHistorique;
  var lien;
  var categorie;
  var prixAcces;
  var surface;
  var positionCarte;
  var image;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    nom: json["nom"],
    dateConstruction: json["dateConstruction"],
    epoqueConstruction: json["epoqueConstruction"],
    personneHistorique: json["personneHistorique"],
    descriptionHistorique: json["descriptionHistorique"],
    lien: json["lien"],
    categorie: json["categorie"],
    prixAcces: json["prixAcces"],
    surface: json["surface"],
    positionCarte: json["positionCarte"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "dateConstruction": dateConstruction,
    "epoqueConstruction": epoqueConstruction,
    "personneHistorique": personneHistorique,
    "descriptionHistorique": descriptionHistorique,
    "lien": lien,
    "categorie": categorie,
    "prixAcces": prixAcces,
    "surface": surface,
    "positionCarte": positionCarte,
    "image": image,
  };
}
