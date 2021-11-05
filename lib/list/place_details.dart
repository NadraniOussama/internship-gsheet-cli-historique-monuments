import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/page/insert_page.dart';

class PlaceDetail extends StatelessWidget {
  final Users user;
  PlaceDetail(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.nom),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InsertPageState(),
              ));
        },
        tooltip: 'Search for monument',
        child: const Icon(Icons.picture_as_pdf),
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
                    const Text("description historique : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(user.descriptionHistorique),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
