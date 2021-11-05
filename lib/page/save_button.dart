import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Size size;
  final double width;
  final VoidCallback onClicked;
  const SaveButton({
    Key key,
    @required this.size,
    @required this.width,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50), shape: StadiumBorder()),
        child: const FittedBox(
          child: Text(
            'save',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: onClicked,
      ),
    );
  }
}
