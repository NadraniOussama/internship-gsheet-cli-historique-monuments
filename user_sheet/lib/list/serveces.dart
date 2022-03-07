import 'dart:convert';

import 'package:user_sheet/list/users.dart';
import 'package:http/http.dart' as http;
import 'package:user_sheet/model/path.dart';
import 'package:flutter/services.dart' as rootBundle;

class Services {
  static Future<List<Users>> getFeedBackFromSheet() async {
    print('hahna bdina11');
    var url =
        "https://script.google.com/macros/s/AKfycbxQ3KRzC3qjxveKy7prjn6O0-tILtUUMpcHhev88x5eQfxTkpv40TiEAjT2T0XQdeA8/exec";
    print('hahna bdina22');
    try {
      print('hahna bdina33');
      var response = await http.get(Uri.parse(url));
      print('hahna bdina44');
      if (response.statusCode == 200) {
        print('hahna bdina55');
        List<Users> users = usersFromJson(response.body);
        print('hahna bdina66');
        print("goooooooooooooooooood");
        return users;
      } else {
        print("nooooooooooooooooooooooooo");
        return <Users>[];
      }
    } catch (err) {
      return <Users>[];
    }
  }

  static Future<List<Path>> getJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString("assets/places.json");
    final list = json.decode(jsonData) as List<dynamic>;

    List<Path> paths = list.map((e) => Path.fromJson(e)).toList();
    for (Path a in paths) {
      print(a.pathName);
      print(a.list);
    }
    return paths;
  }
}
