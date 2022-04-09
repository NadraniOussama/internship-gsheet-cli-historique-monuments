import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PictureWidget extends StatelessWidget {
  PictureWidget({Key? key, required this.imagePath}) : super(key: key);
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Center(
        child: Container(
          height: (MediaQuery.of(context).size.height),
          color: Colors.black26,
          child: Image.network(
            imagePath,
            width: (MediaQuery.of(context).size.width),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Photo"),
        actions: [
          GestureDetector(
            child: Icon(Icons.edit),
            onTap: () {
              print("you about to edit");
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.black,
      ),
    );
  }
}
