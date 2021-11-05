import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.size,
    @required this.text,
    @required this.color,
    @required this.textColor,
    @required this.width,
    @required this.onClicked,
  }) : super(key: key);

  final Size size;
  final VoidCallback onClicked;
  final String text;
  final Color color, textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: color,
          onPressed: onClicked,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
