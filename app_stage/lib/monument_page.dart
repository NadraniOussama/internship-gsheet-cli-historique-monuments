import 'package:flutter/material.dart';

class MonumentPageInput extends StatefulWidget {
  const MonumentPageInput({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  _MonumentPageInputState createState() => _MonumentPageInputState();
}

class _MonumentPageInputState extends State<MonumentPageInput>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.replaceAll('_', ' ')),
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
                  getButtonSyleTwo(
                      context, Colors.orange, 'Walls and rempards', () {}),
                  getButtonSyleTwo(context, Colors.pink, 'Handcrafts', () {}),
                  getButtonSyleTwo(
                      context, Colors.brown, 'Monuments And Souks', () {}),
                  getButtonSyleTwo(
                      context, Colors.blue, 'Wisdom And Knowledge', () {}),
                  getButtonSyleTwo(context, Colors.green,
                      'Places And Andalusian Gandens', () {}),
                  getButtonSyleTwo(context, Colors.purple, 'Fes Jdid', () {}),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Search for monument',
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CircuitList(
        //       circuitName: buttonName,
        //       color: color,
        //     ),
        //   ),
        // );
      },
      child: Text(
        buttonName,
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}
