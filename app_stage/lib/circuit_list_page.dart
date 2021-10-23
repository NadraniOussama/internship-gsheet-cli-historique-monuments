import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/pdf_viewer.dart';

import 'pdf_api.dart';

class CircuitList extends StatefulWidget {
  const CircuitList({Key key, @required this.circuitName, @required this.color})
      : super(key: key);

  final String circuitName;
  final Color color;

  @override
  State<CircuitList> createState() => _CircuitListState();
}

class _CircuitListState extends State<CircuitList> {
  @override
  Widget build(BuildContext context) {
    var test = ['hey', 'yo', 'lol', 'boy'];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.circuitName.replaceAll('_', ' ')),
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
                  for (var i in test) getButton(widget.color, i, () {}),
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
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

Widget getButton(Color color, String buttonName, Function function) {
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
      onPressed: function(),
      child: Text(
        buttonName,
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}
