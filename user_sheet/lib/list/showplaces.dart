
import 'package:flutter/material.dart';
import 'package:user_sheet/list/place_details.dart';
import 'package:user_sheet/list/serveces.dart';
import 'package:user_sheet/list/users.dart';

class ShowPlaces extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _HomeState();
}

class _HomeState extends State<ShowPlaces>{

  late List<Users> _users = [];
  late bool _loading = false;

  @override
  void initState(){
    super.initState();
    Services.getFeedBackFromSheet().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading ..." : "List"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, i){
              Users users = _users[i];
              return Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PlaceDetail(_users[i]) ) );
                  },
                  title: Text(users.nom),
                  leading: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        users.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ) ;
            }
        ),
      )
    );
  }
  
}