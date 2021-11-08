import 'package:flutter/material.dart';
import 'package:user_sheet/list/users.dart';
import 'package:user_sheet/page/insert_page.dart';
class Button_Update extends StatelessWidget {
  const Button_Update({
    Key? key,
    required this.color,
    required this.buttonName,
    required this.funtion,
    required this.user,
  }) : super(key: key);
  final Color color;
  final String buttonName;
  final Function funtion;
  final Users user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InsertPageState(user,color,buttonName) ) );
          },
          child: Text(
            buttonName,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
