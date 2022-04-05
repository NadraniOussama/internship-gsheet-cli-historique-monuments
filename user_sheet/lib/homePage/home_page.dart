import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_sheet/api/pdf_api.dart';
import 'package:user_sheet/homePage/button_elevate.dart';
import 'package:user_sheet/page/pdf_viewer.dart';

class MyHomePage extends StatelessWidget {
  // late BuildContext context;
  late Color color = Colors.black;
  late String buttonName = "name";
  // late Function function;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List of path"),
      ),
      floatingActionButton: FloatingActionButton(
        // TODO: use spead dial to give options
        onPressed: () async {
          String lang = 'en';
          final pathName = 'pdf-files/carte_fes_$lang.pdf';
          File file = await PDFApi.loadAsset(pathName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PDFViewer(file: file);
              },
            ),
          );
        },
        tooltip: 'Search for monument',
        child: const Icon(Icons.map_outlined),
      ),
      // TODO: set up options in endDrawer
      // endDrawer: Container(
      //   child: Text("data"),
      // ),
      body: ListView(
        children: [
          Column(
            children: [
              Button_Elevate(
                  color: Colors.orange,
                  buttonName: "Walls and rempards",
                  start: 1,
                  last: 12,
                  funtion: () {}),
              Button_Elevate(
                  color: Colors.pink,
                  buttonName: "Handcrafts",
                  start: 0,
                  last: 12,
                  funtion: () {}),
              Button_Elevate(
                  color: Colors.brown,
                  buttonName: "Monuments And Souks",
                  start: 0,
                  last: 12,
                  funtion: () {}),
              Button_Elevate(
                  color: Colors.blue,
                  buttonName: "Wisdom And Knowledge",
                  start: 0,
                  last: 12,
                  funtion: () {}),
              Button_Elevate(
                  color: Colors.green,
                  buttonName: "Places And Andalusian Gardens",
                  start: 0,
                  last: 12,
                  funtion: () {}),
              Button_Elevate(
                  color: Colors.purple,
                  buttonName: "Fes Jdid",
                  start: 0,
                  last: 12,
                  funtion: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
