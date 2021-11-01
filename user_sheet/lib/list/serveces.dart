
import 'package:user_sheet/list/users.dart';
import 'package:http/http.dart' as http;

class Services{
  static Future<List<Users>> getFeedBackFromSheet() async {
    var url = "https://script.google.com/macros/s/AKfycbyu7ZfnFq24LLIRUnY-6QfTBoh2uIAK6wXJIH_IdhpyGMvz1qvMejsTSt7CaO5sv5HSsA/exec";
    try{
      var response  = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        List<Users> usres = usersFromJson(response.body);
        print("goooooooooooooooooood");
        return usres;
      } else{
        print("nooooooooooooooooooooooooo");
        return <Users>[];
      }
    }catch(err){
      return <Users>[];
    }

  }
}