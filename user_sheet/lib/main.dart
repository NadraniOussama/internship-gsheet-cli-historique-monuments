import 'package:flutter/material.dart';
import 'package:user_sheet/page/create_sheets.dart';
import 'package:user_sheet/page/insert_page.dart';
import 'api/user_sheet_api.dart';
import 'homePage/home_page.dart';
import 'list/place_details.dart';
import 'list/showplaces.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
