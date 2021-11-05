import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatefulWidget {
  PDFViewer({Key key, @required this.file}) : super(key: key);
  final File file;
  int _pageNum = 1;
  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    var name =
        widget.file.path.split('/').last.split('.').first.replaceAll('_', ' ');

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          Center(child: Text((widget._pageNum.toString() + '/2'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: PDFView(
        filePath: widget.file.path,
        onPageChanged: (_, num2) {
          widget._pageNum = num2;
        },
      ),
    );
  }
}
