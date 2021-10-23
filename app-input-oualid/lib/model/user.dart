

class UserFields{

  static final String id = 'Id';
  static final String nom = 'Nom';
  static final String dateConstruction = 'date de construction';
  static final String epoqueConstruction = 'époque de construction';
  static final String personneHistorique = 'Personne historique ';
  static final String descriptionHistorique = 'description historique';
  static final String lien = 'lien';
  static final String categorie = 'catégorie';
  static final String prixAcces = 'prix d accès';
  static final String surface = 'Surface m²' ;
  static final String  positionCarte = 'position dans carte';
  static final String image = 'image';

  static List<String> getFields()=> [id,dateConstruction,epoqueConstruction,personneHistorique,
                                     descriptionHistorique,lien,categorie,prixAcces,surface,positionCarte,image
                                    ];

}