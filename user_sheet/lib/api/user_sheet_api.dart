import 'dart:convert';
import 'package:gsheets/gsheets.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/model/user.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:user_sheet/model/path.dart';

class UserSheetApi {
  // TODO: remove this from the file and use a file the at contains
  // this key instead to minimise acces to the google sheet
  static final _credentials = r'''
  {
  "type": "service_account",
  "project_id": "ultimate-realm-331100",
  "private_key_id": "203704b631a0586d84f9a53b5199d22162b6decf",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDYSyQaAaMLrVcx\n8lfjTqzgN9H3W04n3USk6rgyoqv/svQKBdNjqB8f+lucaqCpd9f/CYfy+klq0OM5\nKp7UI/KmvsDOP2blAJqHEQyll2Z9Z1iTsbql6p4Djns7AhJ00uKzC3LTgVuQtU1/\nqTZ17VyPczFCLrJpfFhLr4on3dM/HPUwU8uxfwWmEzGpPIjGW7O75GXDCf2KSPOX\nu+9SBEbEiigpf3s+jbeV6R4cSjFMJ0Q2CP9tfHaNdBp/8cv0OJX2c7wiS7xARYLE\nSVVEFS+fmidTCATk/nCgdt5HWIq+Jn6HGUhwmIjCDtRgP4VznW9B0dmb9w42FSAl\nDi8u/taFAgMBAAECggEABeRJTKp0WVV7C8TamNO3aQXCotN9fFLn4C4pa+4U2iQ/\nxySD4f6qymFn39Z8heFApJVxev1PK3YazZ9xlonCisELc3k0QYZHFbX+Ycxb+4wc\nusYBzyv/t4BI4kFny0x4GTR1bkZJywlSERyRrs8TN5a45fqe2+y9L8kAutFG3dZm\nDy/GQVHvsXBgfx455aDEpCZutWnFGNWPxpbn09q1Z5Fh8LjjW21oEm5gH/+kmf0W\ntuJnZAEUUbMsY0tgxdDZGS7KPXo0y2QYD3JJcwrWtwBRg/Qj6cgjUpzH4rmWOL/x\nmD96ihasoTBOb/i8rBM2D2MZleEpVu2gyJjLT9Y4QQKBgQD4WY7oGjuMZoIo7FR0\nW6JAduxAv9fEAKZ7Xzxnym7khdISK/TRc48lp0V+76INEcYmHR+r0FU422tB6xFR\n4ckaURRt8Aen+8y2woCISaX3TTKzOV9zm+ItdYHbMXdSEgXVt/6uzsX2frLSHhgq\n8i7hf3IUA3n6jLllsCm5gai9fQKBgQDe9MrgkN59EPrQ8PGSHV1KaWlO9xT0gO+l\nkjoe6OehW/mMI1aRiqQgfxDttGeya5TtkvyAwWUk3H8rDmZnbkRGLnrdKGStpl+j\nD2LqJ/6n9+nCh8hdRVE4RsMYJnmqI/zCeqFI0Nsv6NMzQwSO37/QcO2K1S8BozJa\n+fjV88jrqQKBgBFrjsefF3A4vIaMVTw4NUBaVyYPjt3zwbnDq2QIYhDrhhm6NZj/\nhxn4CrrlqjNKfOCtiEwv99peIb7k8zkQImATMeCoRpE0614idIuaxuZ65sSFkLl2\nRL41kN9EL/90vi4IkvfGD0LEDl0IuV9Bz6IHo4Pd3o+BkXudiL+3ZZOtAoGAR9tZ\nb5sBOgm47JJbKR5xrMPgfuS/SjYsBo7kUIX78VN1UCcrhWjLkPWi/RmBuk1WCGOx\nIcYy1PiDu9q+QmOVeZENZC3alOTkOeeBl7ogJv6NxnaAqx7mGF8mDaiI2b8TfZKM\nXK2DlyNQvlrBI1MVvRZIWNBwf/SbDBs4iawye1ECgYA6pHwriV9QjtQS4ya5Qzn6\nhVxFVI14ti7bglXB3HnAFVLcapR2WmbcDc1OeKnHkXLOiiFDnb+3roA6D1rDpb35\nfP3rATfq5/9vmGRlu0HWzQI2hfQjEXcmye8ZW9hAJ1sJiF1wMQYbnWK18/ED3zhC\ngyqFh9qrLLDysBOYpHRm4A==\n-----END PRIVATE KEY-----\n",
  "client_email": "users-178@ultimate-realm-331100.iam.gserviceaccount.com",
  "client_id": "112553843314608381036",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/users-178%40ultimate-realm-331100.iam.gserviceaccount.com"
}
  ''';

  static final _spreadsheetId = '1HvyTvUF5E1aPW02TdRX0VGi 5KoLD9Og6KdBxiakk39c';
  static final _gsheets = GSheets(_credentials);
  static var _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'minimum');
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
