import 'package:gsheets/gsheets.dart';
import 'package:user_sheet/model/user.dart';

class UserSheetApi {
  static final _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheet-327220",
  "private_key_id": "03e289348e3d93ea06b99b12b876d58d03598592",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCksoliUrtu1RlU\n+WhSM0z7hTMHEMFwb4NXRvzuwtynTq2xxJoe534zBgfK+aWD2VIkDBYyKSQisj4L\ngbu2LbhIaa1Mcndr27dpaGA5tF5/nLqHF9YvI4rDedYANeWvDPq/dtAw2L5Z30ya\nrIGUcPtLCoDe3DYub2vzY24pSsqI8VRVJVxxUsQn65cj3RZ47iqBXLrudCa4MCAb\nr3mNVPAUiyrZri7xjdW3P6Llj56D3rxCB5gr+ZpE647TcHBZK6UtylgoB5iEKggp\nr9tsziMRRvIIHOupS15K/LitmJbA8eNszK/atTEAkfuR44pWWyQaL2dUO76CPI+N\n6WShqGU5AgMBAAECggEAAgIHOMKndFd2wplz0yS6+IoMMDbdFODXKhY8eTC4/fUw\nmu05r8zEthyJtcjLYssgfD4Fe0ETJrUjmoJPZo4yI/fd3AO9PvxjxQ43thxj1oxz\nnbgFrXdydqWinUgK79JpsDHjoeTSlUfqqCwYPFYQSj7riUwIARLsrv/0VN6Lj5XU\nl/kSZ4lOuBvmFk2xeEnY8Roj25mbGKmSR3op4XF68NuIsLAgUfxfn9djWkglNOpn\n1SRyz/JEOzb0vUoRFPKEIunKVK/5vdjDhxBolzgiKJtN+PmgqH4Q75UfbRy+ECe9\nBgwEI1WG+XCqlv01R15cNh2er0hnW1QSbKwvvlqBsQKBgQDjXyjLF0Pr+q0vzvV7\nSe2PzckA6qcFQgmsJQc9BygMfAf4t4HlnIwkI+yjy3GRkkgih/tBWkQDYj53NB6v\ns8WCKZBuvNCIcauFkI5v6/KgfcB2BwzY5qNDRj08Ib+Iv/Z99NyZpZUEsjgxLurX\nf9Z8O01cZBfq4oCTHMp/bnp8rQKBgQC5bzSEV0RE+r4uPE3i9YyLqKg+vnI7+ATU\nY3OTeoZ6ZWqrfoHUq5zkc0e4ZjaQm9hc/tgg3Yn1P9pIkKSeCdApm3qN85uH9X8H\n8J7OoFhYXd66tomfYLPSuHlQ5YGHd+oJlRTfoJEs9RL49H+AWa17Lrd+UDtU1MiP\nlmlqUEFwPQKBgBSWUy1AaAf/5JqFlLibEwWIToDkvka9mf6aQ7OE6F1pBZfBleNi\nb1X+YrjZ/Oh/ZESsJ1XdhHcB+EH22Ch0kJeeh9NfCUqxcCRh2GPN62QYvspxDPq+\nt12qCHVfYOZS61CwUSEgWwPX1zqs0tq8WoFZJUIOVhQQei/X1YYATNrpAoGASLeX\nPJ6MIxDBK5hyYqIwL0RAVfqRCXtFSZSGajsOKUlD/2RovWFe8SdT5LgQhbzXqAA3\n+QtnYklb7EDsjR0ECIz0Dl6Ni092NULiw9yVSHHnOgkDBwEBA41b5aFanikkGgXg\nXaG1zI9+lSosJcUFBt1XD62e1rFqxQQS6qH2R3ECgYEA1D4IUm+PQVNRzYVY3O0g\nobWPm4f2+ZIC9J3nz0H6OWAKGB/MrwUaGqitOfTWnviUtoBYSYksXb5ogLOU28ID\nrMcP6TnW9srY8FNxplw8bbuRbgTwQ4rHpE+sd7NmUPuCnGF2HxvRRi0gQ4OjHDAm\nBtt2pfGbBuTXwL7j7Ins4eM=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheet-327220.iam.gserviceaccount.com",
  "client_id": "113652211417803313597",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheet-327220.iam.gserviceaccount.com"
  }
  ''';

  static final _spreadsheetId = '1N6CUAtVa3pP_Pg4oywC67ko5FoYeCoVEv3dDdj9zcd0';
  static final _gsheets = GSheets(_credentials);
  static Worksheet _userSheet;
  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');
      final firstRow = UserFields.getFields();
      _userSheet.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {String title}) async {
    try {
      return await spreadsheet.addWorksheet('title');
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet.values.map.appendRows(rowList);
  }
}
