import 'package:flutter/material.dart';
import 'package:user_sheet/api/user_sheet_api.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/model/user.dart';
import 'package:user_sheet/page/picture.dart';

class InsertPageState extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _edit = true;

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
    descriptionHistorique.text = user.descriptionHistorique;
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
      setState() {
        _edit = false;
      }

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
      appBar: AppBar(
        backgroundColor: color,
        title: Text(user.nom),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: this.color.withOpacity(0.7),
                    minRadius: 70,
                    child: ClipOval(
                      child: GestureDetector(
                        child: (user.imagePath == "")
                            ? Icon(
                                Icons.camera_alt,
                                size: 70,
                              )
                            : Image.network(
                                // add picture based on path looks cuter
                                user.imagePath,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                        onTap: (user.imagePath == "")
                            ? () {
                                print("hello clicked");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PictureWidget(imagePath: "")));
                              }
                            : () {
                                print("hello clicked2");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PictureWidget(
                                            imagePath: user.imagePath)));
                              },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildTextField(_edit, color, nameController,
                            "Un nom valide Entrer nom valide", "Nom"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            _edit,
                            color,
                            dateConstructionController,
                            "Enter Valid date Construction",
                            "DateConstruction"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(_edit, color, epoqueController,
                            "Enter Valid Phone Number", "Historical periode"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            _edit,
                            color,
                            pHistoriqueContoller,
                            "Periode Historique pas valable",
                            "Personne Historique"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            _edit,
                            color,
                            descriptionHistorique,
                            "Enter Valid description Historique",
                            "Desciption historique"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(_edit, color, lienCont,
                            "Entrer lien Valid", "Liens"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(_edit, color, categorieController,
                            "Entrer category valide", "Category"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(_edit, color, prixAccesContoller,
                            "Donner prix d'acces valide", "Prix d'access"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(_edit, color, surfaceController,
                            "err surface", "Surface"),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(_edit, color, positionCarte,
                            "hallo error TODO", "Localisation"),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          // color: Colors.blue,
                          // textColor: Colors.white,
                          style: ButtonStyle(),
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

Widget buildTextField(bool edit, Color color, TextEditingController controller,
    String errMessage, String labelText) {
  if (controller.text == "-") {
    controller.text = "";
  }
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return errMessage;
      }
      return null;
    },
    minLines: 1,
    maxLines: 10,
    // onEditingComplete: () {
    //   edit = false;
    // },
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(5.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color.withOpacity(0.2),
        ),
      ),
      filled: true,
      fillColor: Colors.black12,
      labelText: labelText,
      labelStyle: TextStyle(color: color),
      enabled: edit, // need to enable browsing version and modification version
    ),
  );
}
