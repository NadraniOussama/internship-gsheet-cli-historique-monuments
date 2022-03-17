import 'package:flutter/material.dart';
import 'package:user_sheet/list/place_details.dart';
import 'package:user_sheet/list/serveces.dart';
import 'package:user_sheet/list/users.dart';

class ShowPlaces extends StatefulWidget {
  late String buttonName;
  late int start, last;
  late Color color;
  ShowPlaces(this.buttonName, this.start, this.last, this.color);

  @override
  State<StatefulWidget> createState() =>
      _HomeState(this.buttonName, this.start, this.last, this.color);
}

class _HomeState extends State<ShowPlaces> {
  late List<Users> _users = [];
  late List<Path> _paths = [];
  late Path _path;
  late bool _loading = true;
  late String buttonName;
  late int start = 0, last = 0, n = 0;
  late Color color;
  _HomeState(this.buttonName, this.start, this.last, this.color);
  @override
  void initState() {
    super.initState();
    Services.getFeedBackFromSheet(buttonName).then((users) {
      setState(() {
        _users = users;
        _loading = false;
        print("hey hey hey");
        if (_users.length - this.last > 0) {
          n = _users.length - this.last;
        } else {
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
              itemBuilder: (context, i) {
                // if (_paths[i])
                // if ( _pathsp[].contains(_users[i].nom) ){}
                Users user = _users[i + this.start];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceDetail(
                                  _users[i + this.start], this.color)));
                    },
                    title: Text(user.nom),
                    leading: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          user.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
                // }
              }),
        ));
  }
}
