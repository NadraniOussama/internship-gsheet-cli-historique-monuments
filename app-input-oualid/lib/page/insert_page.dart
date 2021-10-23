import 'package:flutter/material.dart';
import 'package:user_sheet/api/user_sheet_api.dart';
import 'package:user_sheet/model/user.dart';

class InsertPageState extends StatelessWidget {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController dateConstruction = TextEditingController();
  TextEditingController epoqueConstruction  = TextEditingController();
  TextEditingController personneHistorique  = TextEditingController();
  TextEditingController descriptionHistorique = TextEditingController();
  TextEditingController lien = TextEditingController();
  TextEditingController categorie = TextEditingController();
  TextEditingController prixAcces = TextEditingController();
  TextEditingController surface= TextEditingController();
  TextEditingController  positionCarte = TextEditingController();
  //TextEditingController image = TextEditingController();

  Future<void> _submitForm() async {

    if(_formKey.currentState!.validate()){
   // descriptionHistorique,lien,categorie,prixAcces,surface,positionCarte,image
      final user = {
        UserFields.id :  nameController.text,
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
      await UserSheetApi.insert([user]);
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
      key:  _scaffoldKey,
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: nameController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Name"
                          ),
                        ),
                        TextFormField(
                          controller: dateConstruction,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter ValiddateConstruction";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "dateConstruction"
                          ),
                        ),
                        TextFormField(
                          controller: epoqueConstruction ,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Phone Number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Phone Number"
                          ),
                        ),
                        TextFormField(
                          controller: personneHistorique ,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Feedback";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Feedback"
                          ),
                        ),
                        TextFormField(
                          controller: descriptionHistorique,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid descriptionHistorique";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Feedback"
                          ),
                        ),
                        TextFormField(
                          controller: lien,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid lien";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Feedback"
                          ),
                        ),
                        TextFormField(
                          controller: categorie,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Name"
                          ),
                        ),
                        TextFormField(
                          controller: prixAcces,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Email"
                          ),
                        ),
                        TextFormField(
                          controller: surface,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Phone Number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Phone Number"
                          ),
                        ),
                        TextFormField(
                          controller:  positionCarte,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Feedback";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Feedback"
                          ),
                        ),
                       /* TextFormField(
                          controller: image,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Valid Feedback";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Feedback"
                          ),
                        ),*/
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
