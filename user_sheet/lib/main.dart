import 'package:flutter/material.dart';
import 'homePage/home_page.dart';

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
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue),
        floatingActionButtonTheme: FloatingActionButtonThemeData(),
        appBarTheme: AppBarTheme(color: Colors.blue),
        buttonBarTheme: ButtonBarThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(10.0)),
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red)),
              )),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
