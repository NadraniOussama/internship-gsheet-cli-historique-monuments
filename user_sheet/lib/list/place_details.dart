import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_sheet/homePage/button_elevate.dart';
import 'package:user_sheet/list/button_update.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/page/insert_page.dart';

class PlaceDetail extends StatelessWidget{
  late final Users user ;
  late Color color;
  PlaceDetail(this.user, this.color);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(user.nom),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Image.network(user.image),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowText("description historique : ",user.descriptionHistorique),
                  ShowText("date de construction:",user.dateConstruction),
                  Button_Update(color: color, buttonName: 'Update',funtion: ButtonSelect, user: user),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Column ShowText( String title, var context ) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(context),
                  ],
                );
  }

  void ButtonSelect(BuildContext context,Users user,Color color,String buttonName){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InsertPageState(user,color,buttonName) ) );
  }

}