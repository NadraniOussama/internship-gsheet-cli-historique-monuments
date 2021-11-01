import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_sheet/list/users.dart';

class PlaceDetail extends StatelessWidget{
  late final Users user ;
  PlaceDetail(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
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
                  Text("description historique : ",
                      style: TextStyle(
                    fontWeight: FontWeight.bold,

                  )),
                  Text(user.descriptionHistorique),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

}