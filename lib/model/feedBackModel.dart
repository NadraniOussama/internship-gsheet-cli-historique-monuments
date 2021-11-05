class FeedBackModel {
  String id;
  String nom;
  String dateConstruction;
  String epoqueConstruction;
  String personneHistorique;
  String descriptionHistorique;
  String lien;
  String categorie;
  String prixAcces;
  String surface;
  String positionCarte;
  String image;

  FeedBackModel({
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
  factory FeedBackModel.fromJson(dynamic json) {
    return FeedBackModel(
      id: "${json['id']}",
      nom: "${json['nom']}",
      dateConstruction: "${json['dateConstruction']}",
      epoqueConstruction: "${json['epoqueConstruction']}",
      personneHistorique: "${json['personneHistorique']}",
      descriptionHistorique: "${json['descriptionHistorique']}",
      lien: "${json['lien']}",
      categorie: "${json['categorie']}",
      prixAcces: "${json['prixAcces']}",
      surface: "${json['surface']}",
      positionCarte: "${json['positionCarte']}",
      image: "${json['image']}",
    );
  }

  Map toJson() => {
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
