
class FeedBackModel{
  String id ;
  String nom ;
  String dateConstruction;
  String epoqueConstruction;
  String personneHistorique;
  String descriptionHistorique;
  String lien;
  String categorie;
  String prixAcces;
  String surface;
  String  positionCarte;
  String image;

  FeedBackModel({required this.id,required this.nom,required this.dateConstruction,required this.epoqueConstruction,
    required this.personneHistorique,required this.descriptionHistorique,required this.lien,
    required this.categorie,required this.prixAcces,required this.surface,required this.positionCarte,required this.image});
    factory FeedBackModel.fromJson(dynamic json){
      return FeedBackModel(
          id: "${json['id']}"  ,
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
      "id": id ,
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
      "image":image,
    };
}