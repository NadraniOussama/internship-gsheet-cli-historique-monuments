import 'package:flutter/material.dart';
import 'package:user_sheet/api/user_sheet_api.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/model/user.dart';

class InsertPageState extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController dateConstructionController = TextEditingController();
  TextEditingController epoqueController = TextEditingController();
  TextEditingController pHistoriqueContoller = TextEditingController();
  TextEditingController descriptionHistorique = TextEditingController();
  TextEditingController lienCont = TextEditingController();
  TextEditingController categorieController = TextEditingController();
  TextEditingController prixAccesContoller = TextEditingController();
  TextEditingController surfaceController = TextEditingController();
  TextEditingController positionCarte = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();
  late Users user;
  late Color color;
  String buttonName;
  InsertPageState(this.user, this.color, this.buttonName) {
    nameController.text = user.nom;
    dateConstructionController.text = user.dateConstruction;
    epoqueController.text = user.epoqueConstruction;
    pHistoriqueContoller.text = user.personneHistorique;
    lienCont.text = user.lien;
    categorieController.text = user.categorie;
    prixAccesContoller.text = user.prixAcces;
    surfaceController.text = user.surface;
    positionCarte.text = user.positionCarte;
    imageController.text = user.image;
    imagePathController.text = user.imagePath;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // descriptionHistorique,lien,categorie,prixAcces,surface,positionCarte,image
      final Map<String, dynamic> users = {
        UserFields.nom: nameController.text,
        UserFields.dateConstruction: dateConstructionController.text,
        UserFields.epoqueConstruction: epoqueController.text,
        UserFields.personneHistorique: pHistoriqueContoller.text,
        UserFields.descriptionHistorique: descriptionHistorique.text,
        UserFields.lien: lienCont.text,
        UserFields.categorie: categorieController.text,
        UserFields.prixAcces: prixAccesContoller.text,
        UserFields.surface: surfaceController.text,
        UserFields.positionCarte: positionCarte.text,
      };

      /*Users users = { nom: nom.text,
          dateConstruction: dateConstruction.text, epoqueConstruction: epoqueConstruction.text,
          personneHistorique: personneHistorique.text, descriptionHistorique: descriptionHistorique.text,
          lien: lien.text, categorie: categorie.text, positionCarte: positionCarte.text, image: image.text} as Users ;*/

      await UserSheetApi.update("1", users);
      await UserSheetApi.init();

      _showSnackbar("Submitting Feedback");
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.network(
                      user.imagePath,
                      fit: BoxFit.cover,
                    ),
                    height: 100,
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildTextField(color, nameController,
                            "Un nom valide Entrer nom valide", "Nom"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            color,
                            dateConstructionController,
                            "Enter Valid date Construction",
                            "DateConstruction"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(color, epoqueController,
                            "Enter Valid Phone Number", "Historical periode"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            color,
                            pHistoriqueContoller,
                            "Periode Historique pas valable",
                            "Personne Historique"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            color,
                            descriptionHistorique,
                            "Enter Valid description Historique",
                            "Desciption historique"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            color, lienCont, "Entrer lien Valid", "Liens"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(color, categorieController,
                            "Entrer category valide", "Category"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(color, prixAccesContoller,
                            "Donner prix d'acces valide", "Prix d'access"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            color, surfaceController, "err surface", "Surface"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(color, positionCarte, "hallo error TODO",
                            "Localisation"),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: _submitForm,
                          child: Text('Submit Feedback'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(Color color, TextEditingController controller,
        String errMessage, String labelText) =>
    TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return errMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
        // prefixIcon: Icon(
        //   Icons.person,
        //   color: Colors.red,
        // ),
        filled: true,
        fillColor: Colors.black12,
        labelText: labelText,
        labelStyle: TextStyle(color: color),
      ),
    );
