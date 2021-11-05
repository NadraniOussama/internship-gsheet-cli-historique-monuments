// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.nom,
    this.dateConstruction,
    this.epoqueConstruction,
    this.personneHistorique,
    this.descriptionHistorique,
    this.lien,
    this.categorie,
    this.prixAcces,
    this.surface,
    this.positionCarte,
    this.image,
  });

  int id;
  final String nom;
  final String dateConstruction;
  final String epoqueConstruction;
  final String personneHistorique;
  final String descriptionHistorique;
  final String lien;
  final String categorie;
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
}
