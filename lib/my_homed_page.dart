import 'package:flutter/material.dart';

import 'package:user_sheet/page/insert_page.dart';
import 'dart:io';
import 'package:user_sheet/pdf_viewer.dart';

import 'package:user_sheet/list/place_details.dart';
import 'list/showplaces.dart';
import 'pdf_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context1, constraints) => ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth * 0.7,
              ),
              child: Column(
                children: [
                  getButtonSyleTwo(context, Colors.orange, 'Walls and rempards',
                      openCercuitList),
                  getButtonSyleTwo(
                      context, Colors.pink, 'Handcrafts', openCercuitList),
                  getButtonSyleTwo(context, Colors.brown, 'Monuments And Souks',
                      openCercuitList),
                  getButtonSyleTwo(context, Colors.blue, 'Wisdom And Knowledge',
                      openCercuitList),
                  getButtonSyleTwo(context, Colors.green,
                      'Places And Andalusian Gandens', openCercuitList),
                  getButtonSyleTwo(
                      context, Colors.purple, 'Fes Jdid', openCercuitList),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String lang = 'en';
          final pathName = 'pdf-files/carte_fes_$lang.pdf';
          File file = await PDFApi.loadAsset(pathName);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return PDFViewer(file: file);
            },
          ));
        },
        tooltip: 'Search for monument',
        child: const Icon(Icons.picture_as_pdf),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void openCercuitList(BuildContext context, String circuitName, Color color) =>
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => CircuitList(
          //   circuitName: circuitName,
          //   color: color,
          // ),
          builder: (context) => InsertPageState(
              // circuitName: circuitName,
              // color: color,
              ),
        ),
      );
    });

Widget getButtonSyleTwo(
    BuildContext context, Color color, String buttonName, Function function) {
  return Container(
    margin: const EdgeInsets.all(10),
    height: 50.0,
    width: 300,
    child: ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.all(10.0)),
          foregroundColor: MaterialStateColor.resolveWith((states) => color),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: color)),
          )),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => InsertPageState(),
            // builder: (context) => PlaceDetail(user:),
            builder: (context) => ShowPlaces(),
          ),
        );
      },
      // onLongPress: function(context, buttonName, color),
      child: Text(
        buttonName,
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}
