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
  TextEditingController dateConstruction = TextEditingController();
  TextEditingController epoqueConstruction = TextEditingController();
  TextEditingController personneHistorique = TextEditingController();
  TextEditingController descriptionHistorique = TextEditingController();
  TextEditingController lien = TextEditingController();
  TextEditingController categorie = TextEditingController();
  TextEditingController prixAcces = TextEditingController();
  TextEditingController surface = TextEditingController();
  TextEditingController positionCarte = TextEditingController();
  TextEditingController image = TextEditingController();
  late Users user;
  late Color color;
  String buttonName;
  InsertPageState(this.user, this.color, this.buttonName);

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // descriptionHistorique,lien,categorie,prixAcces,surface,positionCarte,image
      final Map<String, dynamic> users = {
        UserFields.nom: nameController.text,
        UserFields.dateConstruction: dateConstruction.text,
        UserFields.epoqueConstruction: epoqueConstruction.text,
        UserFields.personneHistorique: personneHistorique.text,
        UserFields.descriptionHistorique: descriptionHistorique.text,
        UserFields.lien: lien.text,
        UserFields.categorie: categorie.text,
        UserFields.prixAcces: prixAcces.text,
        UserFields.surface: surface.text,
        UserFields.positionCarte: positionCarte.text,
        //UserFields.image = image.text
      };

      /*Users users = { nom: nom.text,
          dateConstruction: dateConstruction.text, epoqueConstruction: epoqueConstruction.text,
          personneHistorique: personneHistorique.text, descriptionHistorique: descriptionHistorique.text,
          lien: lien.text, categorie: categorie.text, positionCarte: positionCarte.text, image: image.text} as Users ;*/

      // await UserSheetApi.insert([user]);
      print(users);
      await UserSheetApi.update("1", users);
      print(users);
      await UserSheetApi.init();

      _showSnackbar("Submitting Feedback");
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  String labelText = "Enter";

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
                  TextFormField(
                    //initialValue: this.user.nom,
                    controller: dateConstruction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Valid date Construction";
                      }
                      return null;
                    },
                    //initialValue: this.user.nom,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: color),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: color,
                        ),
                      ),
                      filled: true,
                      //fillColor: Colors.red[50],
                      labelText: labelText,
                      labelStyle: TextStyle(color: color),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          // ignore: unnecessary_null_comparison
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: "Name"),
                        ),
                        TextFormField(
                          controller: dateConstruction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid date Construction";
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(labelText: "DateConstruction"),
                        ),
                        TextFormField(
                          controller: epoqueConstruction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid Phone Number";
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                        ),
                        TextFormField(
                          controller: personneHistorique,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "_";
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(labelText: "Personne historique"),
                        ),
                        TextFormField(
                          controller: descriptionHistorique,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid description Historique";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Desciption historique"),
                        ),
                        TextFormField(
                          controller: lien,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid lien";
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(labelText: "Lien intenet"),
                        ),
                        TextFormField(
                          controller: categorie,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid gategory";
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: "Category"),
                        ),
                        TextFormField(
                          controller: prixAcces,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "_";
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(labelText: "Prix d'access"),
                        ),
                        TextFormField(
                          controller: surface,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "_";
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: "Surface "),
                        ),
                        TextFormField(
                          controller: positionCarte,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixText: "esfsfsf", labelText: "Localisation"),
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

Widget buildTextField() => TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        filled: true,
        fillColor: Colors.red[50],
        labelText: "Enter your Name",
        labelStyle: TextStyle(color: Colors.red),
      ),
    );
