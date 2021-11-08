
import 'package:user_sheet/list/users.dart';
import 'package:http/http.dart' as http;

class Services{
  static Future<List<Users>> getFeedBackFromSheet() async {
    print('hahna bdina11');
    var url = "https://script.google.com/macros/s/AKfycbxQ3KRzC3qjxveKy7prjn6O0-tILtUUMpcHhev88x5eQfxTkpv40TiEAjT2T0XQdeA8/exec";
    print('hahna bdina22');
    try{
      print('hahna bdina33');
      var response  = await http.get(Uri.parse(url));
      print('hahna bdina44');
      if(response.statusCode == 200){
        print('hahna bdina55');
        List<Users> users = usersFromJson(response.body);
        print('hahna bdina66');
        print("goooooooooooooooooood");
        return users;
      } else{
        print("nooooooooooooooooooooooooo");
        return <Users>[];
      }
    }catch(err){
      return <Users>[];
    }

  }
}