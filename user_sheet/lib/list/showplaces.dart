
import 'package:flutter/material.dart';
import 'package:user_sheet/list/place_details.dart';
import 'package:user_sheet/list/serveces.dart';
import 'package:user_sheet/list/users.dart';

class ShowPlaces extends StatefulWidget{
  late String buttonName;
  late int  start, last;
  late Color color;
  ShowPlaces(this.buttonName, this.start, this.last,this.color);

  @override
  State<StatefulWidget> createState()=> _HomeState(this.buttonName, this.start, this.last,this.color);
}

class _HomeState extends State<ShowPlaces>{

  late List<Users> _users = [];
  late bool _loading = false;
  late String buttonName;
  late int  start = 0, last= 0, n = 0;
  late Color color;
  _HomeState(this.buttonName, this.start, this.last,this.color);
  @override
  void initState(){
    super.initState();
    Services.getFeedBackFromSheet().then((users) {
      setState(() {
        _users = users;
        _loading = false;


        if(_users.length - this.last > 0){
          n = _users.length - this.last;
        }else{
          n = 0;
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(_loading ? "Loading ..." : this.buttonName),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : n,
            itemBuilder: (context,i){
              Users users = _users[i + this.start];
              return Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PlaceDetail(_users[i + this.start],this.color) ) );
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