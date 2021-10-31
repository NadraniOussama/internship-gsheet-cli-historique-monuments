import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  DefaultButton({Key key, this.function, this.color, this.buttonName})
      : super(key: key);
  Function function;
  Color color;
  String buttonName;

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.all(10.0)),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => widget.color),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: widget.color)),
            )),
        onPressed: widget.function(),
        child: Text(
          widget.buttonName,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
