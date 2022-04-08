import 'package:flutter/material.dart';
import 'package:user_sheet/api/user_sheet_api.dart';
import 'package:user_sheet/list/place_details.dart';
import 'package:user_sheet/list/users.dart';

// might need a checkmark to check if we have all the information about the historical monument
// needs some styling if to look cuter and on brand
// the design is kinda of shit but functional (functionality is the goal)
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
  late bool _loading = false;
  late String buttonName;
  late int start = 0, last = 0, n = 0;
  late Color color;
  _HomeState(this.buttonName, this.start, this.last, this.color);
  @override
  void initState() {
    super.initState();
    UserSheetApi.getFromPath(buttonName).then((users) {
      setState(() {
        _users = users;
        _loading = false;
        n = _users.length;
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
          color: Colors.white24,
          child: ListView.builder(
              itemCount: null == _users ? 0 : n,
              itemBuilder: (context, i) {
                Users user = _users[i];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlaceDetail(_users[i], this.color)));
                    },
                    title: Text(user.nom),
                    leading: CircleAvatar(
                      backgroundColor: this.color,
                      child: ClipOval(
                        child: (user.imagePath == "")
                            ? Container(child: Icon(Icons.camera_alt))
                            : Image.network(
                                // add picture based on path looks cuter
                                user.imagePath,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
