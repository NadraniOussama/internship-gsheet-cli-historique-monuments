import 'dart:convert';
import 'package:user_sheet/model/user.dart';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    required this.imagePath,
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
  String imagePath;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: int.parse(json[UserFields.id]),
      nom: json[UserFields.nom],
      dateConstruction: json[UserFields.dateConstruction],
      epoqueConstruction: json[UserFields.epoqueConstruction],
      personneHistorique: json[UserFields.personneHistorique],
      descriptionHistorique: json[UserFields.descriptionHistorique],
      lien: json[UserFields.lien],
      categorie: json[UserFields.categorie],
      prixAcces: json[UserFields.prixAcces],
      surface: json[UserFields.surface],
      positionCarte: json[UserFields.positionCarte],
      image: json[UserFields.image],
      imagePath: json[UserFields.imagePath]);

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.nom: nom,
        UserFields.dateConstruction: dateConstruction,
        UserFields.epoqueConstruction: epoqueConstruction,
        UserFields.personneHistorique: personneHistorique,
        UserFields.descriptionHistorique: descriptionHistorique,
        UserFields.lien: lien,
        UserFields.categorie: categorie,
        UserFields.prixAcces: prixAcces,
        UserFields.surface: surface,
        UserFields.positionCarte: positionCarte,
        UserFields.image: image,
        UserFields.imagePath: imagePath
      };
}
