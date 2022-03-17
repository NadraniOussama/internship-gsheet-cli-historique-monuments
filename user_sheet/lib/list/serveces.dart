import 'dart:convert';

import 'package:user_sheet/list/users.dart';
import 'package:http/http.dart' as http;
import 'package:user_sheet/model/path.dart';
import 'package:flutter/services.dart' as rootBundle;

class Services {
  static Future<List<Users>> getFeedBackFromSheet(String namePath) async {
    // print('hahna bdina11');
    var url =
        "https://script.google.com/macros/s/AKfycbxQ3KRzC3qjxveKy7prjn6O0-tILtUUMpcHhev88x5eQfxTkpv40TiEAjT2T0XQdeA8/exec";
    try {
      // print('hahna bdina33');
      var response = await http.get(Uri.parse(url));
      // print('hahna bdina44');
      if (response.statusCode == 200) {
        List<Users> users = usersFromJson(response.body);
        List<Users> result = [];
        List<String>? nameMonuments = await getJsonData(namePath);
        // print('hahna bdina55');

        users.forEach((element) {
          print(nameMonuments);
          if (nameMonuments!.contains(element.nom)) {
            print("it is true");
            result.add(element);
          }
          print("loop ${element.nom}");
        });
        print("goooooooooooooooooood");
        return result;
      } else {
        print("nooooooooooooooooooooooooo");
        return <Users>[];
      }
    } catch (err) {
      return <Users>[];
    }
  }

  static Future<List<String>?> getJsonData(String namePath) async {
    print("test 1");
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/places.json');
    print("test 2");
    final list = json.decode(jsonData) as List<dynamic>;
    print("test 3");
    List<Path> paths = list.map((e) => Path.fromJson(e)).toList();
    print("test 4");
    var lists;
    print("test 5");
    paths.forEach((element) {
      if (element.pathName == namePath) {
        lists = element.list!;
      }
    });
    print("hey we donezo");
    return lists;
  }
}
