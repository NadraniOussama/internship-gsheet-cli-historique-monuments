import 'package:flutter/material.dart';
import 'package:user_sheet/page/text_field_container.dart';

class RounedInputFiled extends StatelessWidget {
  const RounedInputFiled({
    Key key,
    @required this.size,
    @required this.hintText,
    @required this.icon,
    @required this.onChanged,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
