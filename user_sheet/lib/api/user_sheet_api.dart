import 'dart:convert';
import 'package:gsheets/gsheets.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/model/keys.dart';
import 'package:user_sheet/model/user.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:user_sheet/model/path.dart';
import 'package:user_sheet/model/keys.dart';

class UserSheetApi {
  // you need to have access to the file keys.dart that contains the key the credentials and key
  static final GSheets _gsheets = GSheets(Keys.credentials());
  static var _userSheet;
  static var _detailedSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(Keys.spreadSheetID());
      _userSheet = await _getWorkSheet(spreadsheet, title: 'minimum');
      _detailedSheet = await _getWorkSheet(spreadsheet, title: "detaille");
      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
    String id,
    Map<String, dynamic> user,
  ) async {
    if (_userSheet == null) return false;
    return _userSheet!.values.map.insertRowByKey(id, user);
  }

  static Future<List<Users>> getAll() async {
    await init();
    if (_userSheet == null) return <Users>[];
    List<Map<String, String>>? users = await _userSheet!.values.map.allRows();
    return users == null
        ? <Users>[]
        : users.map((e) => Users.fromJson(e)).toList();
  }

  static Future<List<Users>> getFromPath(String namePath) async {
    await init();
    if (_userSheet == null) return <Users>[];
    List<Map<String, String>>? users = await _userSheet!.values.map.allRows();
    List<Users> _users = users!.map((e) => Users.fromJson(e)).toList();
    List<int> nameMonuments = await getJsonData(namePath);
    List<Users> result = [];
    _users.forEach((e) {
      nameMonuments.forEach((mon) {
        if (mon == e.id) result.add(e);
      });
    });
    return result;
  }

  static Future<List<int>> getJsonData(String namePath) async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/places2.json');
    final list = json.decode(jsonData) as List<dynamic>;
    List<Path> paths = list.map((e) => Path.fromJson(e)).toList();
    var lists;
    paths.forEach((element) {
      if (element.pathName == namePath) {
        lists = element.list!;
      }
    });
    return lists;
  }

  static Future getImages() async {
    // TODO: get images
  }
}
